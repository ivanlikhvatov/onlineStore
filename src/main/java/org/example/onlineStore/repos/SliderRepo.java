package org.example.onlineStore.repos;

import org.example.onlineStore.domain.Slider;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SliderRepo extends JpaRepository<Slider, Long> {
    Slider findByName(String name);
}
