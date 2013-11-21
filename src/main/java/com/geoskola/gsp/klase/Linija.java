package com.geoskola.gsp.klase;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Linija {

    /**
     */
    private Tocka tocka1;

    /**
     */
    private Tocka tocka2;

    /**
     */
    private String description;
}
