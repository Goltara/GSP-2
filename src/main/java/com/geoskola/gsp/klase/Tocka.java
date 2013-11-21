package com.geoskola.gsp.klase;
import javax.persistence.ManyToOne;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Tocka {

    /**
     */
    private Double X;

    /**
     */
    private Double Y;

    /**
     */
    private Double H;

    /**
     */
    private String tockaID;

    /**
     */
    @ManyToOne
    private TipTocke tip;
}
