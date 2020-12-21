package org.example.onlineStore.domain;

import org.example.onlineStore.insideClasses.LoadableFiles;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "mainSlider")
public class Slider implements LoadableFiles {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String name;

    private String topInscription1;
    private String underInscription1;

    private String topInscription2;
    private String underInscription2;

    private String topInscription3;
    private String underInscription3;

    private String topInscription4;
    private String underInscription4;

    @ElementCollection
    @CollectionTable (name = "pathsToMainSliderImages", joinColumns = @JoinColumn (name = "slider_id"))
    @Column (name = "path")
    private List<String> filesNames;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTopInscription1() {
        return topInscription1;
    }

    public void setTopInscription1(String topInscription1) {
        this.topInscription1 = topInscription1;
    }

    public String getUnderInscription1() {
        return underInscription1;
    }

    public void setUnderInscription1(String underInscription1) {
        this.underInscription1 = underInscription1;
    }

    public String getTopInscription2() {
        return topInscription2;
    }

    public void setTopInscription2(String topInscription2) {
        this.topInscription2 = topInscription2;
    }

    public String getUnderInscription2() {
        return underInscription2;
    }

    public void setUnderInscription2(String underInscription2) {
        this.underInscription2 = underInscription2;
    }

    public String getTopInscription3() {
        return topInscription3;
    }

    public void setTopInscription3(String topInscription3) {
        this.topInscription3 = topInscription3;
    }

    public String getUnderInscription3() {
        return underInscription3;
    }

    public void setUnderInscription3(String underInscription3) {
        this.underInscription3 = underInscription3;
    }

    public String getTopInscription4() {
        return topInscription4;
    }

    public void setTopInscription4(String topInscription4) {
        this.topInscription4 = topInscription4;
    }

    public String getUnderInscription4() {
        return underInscription4;
    }

    public void setUnderInscription4(String underInscription4) {
        this.underInscription4 = underInscription4;
    }

    public List<String> getFilesNames() {
        return filesNames;
    }

    public void setFilesNames(List<String> filesNames) {
        this.filesNames = filesNames;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Slider{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", topInscription1='" + topInscription1 + '\'' +
                ", underInscription1='" + underInscription1 + '\'' +
                ", topInscription2='" + topInscription2 + '\'' +
                ", underInscription2='" + underInscription2 + '\'' +
                ", topInscription3='" + topInscription3 + '\'' +
                ", underInscription3='" + underInscription3 + '\'' +
                ", topInscription4='" + topInscription4 + '\'' +
                ", underInscription4='" + underInscription4 + '\'' +
                ", filesNames=" + filesNames +
                '}';
    }
}
