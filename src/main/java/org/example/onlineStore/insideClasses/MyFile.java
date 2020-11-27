package org.example.onlineStore.insideClasses;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Component
public class MyFile {
    @Value("${upload.path}")
    private String uploadPath;

    public List<String> loadFilesAndGetFileNames(List<MultipartFile> files) throws IOException {
        List<String> namesFiles = new ArrayList<>();

        for (MultipartFile file: files) {
            if (file != null && !file.getOriginalFilename().isEmpty()) {
                File uploadDir = new File(uploadPath);

                if (!uploadDir.exists()){
                    uploadDir.mkdir();
                }

                String uuidFile = UUID.randomUUID().toString();
                String resultFilename = uuidFile + "." + file.getOriginalFilename();

                file.transferTo(new File(uploadPath + "/" + resultFilename));

                namesFiles.add(resultFilename);
            }
        }

        return namesFiles;
    }


    public List<String> reloadingFilesAndGetFileNames(List<MultipartFile> files, LoadableFiles reloadableClass) throws IOException {
        List<String> namesFiles = loadFilesAndGetFileNames(files);


        if (!reloadableClass.getFilesNames().isEmpty() && !namesFiles.isEmpty()){
            for (String fileName : reloadableClass.getFilesNames()) {
                File oldFile = new File(uploadPath + "/" + fileName);
                if (oldFile.delete()){
                    System.out.println("файл успешно удален");
                }

            }
        }

        return namesFiles;
    }
}
