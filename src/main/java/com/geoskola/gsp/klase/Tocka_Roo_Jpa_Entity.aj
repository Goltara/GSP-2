// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.geoskola.gsp.klase;

import com.geoskola.gsp.klase.Tocka;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Tocka_Roo_Jpa_Entity {
    
    declare @type: Tocka: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Tocka.id;
    
    @Version
    @Column(name = "version")
    private Integer Tocka.version;
    
    public Long Tocka.getId() {
        return this.id;
    }
    
    public void Tocka.setId(Long id) {
        this.id = id;
    }
    
    public Integer Tocka.getVersion() {
        return this.version;
    }
    
    public void Tocka.setVersion(Integer version) {
        this.version = version;
    }
    
}
