// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.geoskola.gsp.klase;

import com.geoskola.gsp.klase.Linija;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Linija_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Linija.entityManager;
    
    public static final EntityManager Linija.entityManager() {
        EntityManager em = new Linija().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Linija.countLinijas() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Linija o", Long.class).getSingleResult();
    }
    
    public static List<Linija> Linija.findAllLinijas() {
        return entityManager().createQuery("SELECT o FROM Linija o", Linija.class).getResultList();
    }
    
    public static Linija Linija.findLinija(Long id) {
        if (id == null) return null;
        return entityManager().find(Linija.class, id);
    }
    
    public static List<Linija> Linija.findLinijaEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Linija o", Linija.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Linija.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Linija.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Linija attached = Linija.findLinija(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Linija.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Linija.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Linija Linija.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Linija merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
