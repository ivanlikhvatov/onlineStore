package org.example.onlineStore.repos;

import org.example.onlineStore.domain.Directory;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DirectoryRepo extends JpaRepository<Directory, Long> {
    List<Directory> findAllByName(String name);
    Directory findByNameAndValue(String name, String value);
}
