package org.example.onlineStore.controller;

import org.example.onlineStore.domain.Slider;
import org.example.onlineStore.insideClasses.MyFile;
import org.example.onlineStore.service.BasketService;
import org.example.onlineStore.service.SliderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/slider")
public class SliderController {
    @Value("${upload.path}")
    private String uploadPath;

    @Autowired
    SliderService sliderService;

    @Autowired
    BasketService basketService;

    @Autowired
    MyFile myFile;

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/add")
    public String slider(Model model){
        model.addAttribute("basketRepo", basketService);
        return "addSlider";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/list")
    public String sliderList(Model model){
        model.addAttribute("basketRepo", basketService);
        model.addAttribute("sliders", sliderService.findAll());
        return "listSliderForEdit";
    }


    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("/add")
    public String addSlider(Slider slider,
                            @RequestParam("file") List<MultipartFile> files,
                            Model model
    ) throws IOException {
        model.addAttribute("basketRepo", basketService);

        slider.setFilesNames(myFile.loadFilesAndGetFileNames(files));

        sliderService.save(slider);

        return "redirect:/";
    }




    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("{slider}")
    public String sliderEditForm(@PathVariable Slider slider, Model model){
        model.addAttribute("basketRepo", basketService);
        model.addAttribute("slider", slider);
        model.addAttribute("productService", sliderService);

        return "editSlider";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("{sliderId}")
    public String sliderUpdate(
            Slider newSlider,
            @RequestParam("sliderId") Slider oldSlider,
            @RequestParam("file") List<MultipartFile> files,
            @PathVariable String sliderId) throws IOException {

        List<String> newFilenames = myFile.reloadingFilesAndGetFileNames(files, oldSlider);

        if (!newFilenames.isEmpty()){
            oldSlider.setFilesNames(newFilenames);
        }

        sliderService.updateSlider(newSlider, oldSlider);

        return "redirect:/";
    }


}
