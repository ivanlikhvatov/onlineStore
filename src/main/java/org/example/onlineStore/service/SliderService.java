package org.example.onlineStore.service;

import org.example.onlineStore.domain.Slider;
import org.example.onlineStore.repos.SliderRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;

@Service
public class SliderService {
    @Autowired
    SliderRepo sliderRepo;

    public void save(Slider slider) {
        sliderRepo.save(slider);
    }

    public void updateSlider(Slider newSlider, Slider oldSlider) {

        if (!StringUtils.isEmpty(newSlider.getName())){
            oldSlider.setName(newSlider.getName());
        }

        if (!StringUtils.isEmpty(newSlider.getTopInscription1())){
            oldSlider.setTopInscription1(newSlider.getTopInscription1());
        }

        if (!StringUtils.isEmpty(newSlider.getTopInscription2())){
            oldSlider.setTopInscription2(newSlider.getTopInscription2());
        }

        if (!StringUtils.isEmpty(newSlider.getTopInscription3())){
            oldSlider.setTopInscription3(newSlider.getTopInscription3());
        }

        if (!StringUtils.isEmpty(newSlider.getTopInscription4())){
            oldSlider.setTopInscription4(newSlider.getTopInscription4());
        }


        if (!StringUtils.isEmpty(newSlider.getUnderInscription1())){
            oldSlider.setUnderInscription1(newSlider.getUnderInscription1());
        }

        if (!StringUtils.isEmpty(newSlider.getUnderInscription2())){
            oldSlider.setUnderInscription2(newSlider.getUnderInscription2());
        }

        if (!StringUtils.isEmpty(newSlider.getUnderInscription3())){
            oldSlider.setUnderInscription3(newSlider.getUnderInscription3());
        }

        if (!StringUtils.isEmpty(newSlider.getUnderInscription4())){
            oldSlider.setUnderInscription4(newSlider.getUnderInscription4());
        }

        sliderRepo.save(oldSlider);
    }

    public List<Slider> findAll() {
        return sliderRepo.findAll();
    }

    public Slider findByName(String name) {
        return sliderRepo.findByName(name);
    }
}
