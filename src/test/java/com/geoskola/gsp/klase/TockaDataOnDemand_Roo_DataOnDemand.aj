// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.geoskola.gsp.klase;

import com.geoskola.gsp.klase.TipTockeDataOnDemand;
import com.geoskola.gsp.klase.Tocka;
import com.geoskola.gsp.klase.TockaDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect TockaDataOnDemand_Roo_DataOnDemand {
    
    declare @type: TockaDataOnDemand: @Component;
    
    private Random TockaDataOnDemand.rnd = new SecureRandom();
    
    private List<Tocka> TockaDataOnDemand.data;
    
    @Autowired
    TipTockeDataOnDemand TockaDataOnDemand.tipTockeDataOnDemand;
    
    public Tocka TockaDataOnDemand.getNewTransientTocka(int index) {
        Tocka obj = new Tocka();
        setH(obj, index);
        setTockaID(obj, index);
        setX(obj, index);
        setY(obj, index);
        return obj;
    }
    
    public void TockaDataOnDemand.setH(Tocka obj, int index) {
        Double H = new Integer(index).doubleValue();
        obj.setH(H);
    }
    
    public void TockaDataOnDemand.setTockaID(Tocka obj, int index) {
        String tockaID = "tockaID_" + index;
        obj.setTockaID(tockaID);
    }
    
    public void TockaDataOnDemand.setX(Tocka obj, int index) {
        Double X = new Integer(index).doubleValue();
        obj.setX(X);
    }
    
    public void TockaDataOnDemand.setY(Tocka obj, int index) {
        Double Y = new Integer(index).doubleValue();
        obj.setY(Y);
    }
    
    public Tocka TockaDataOnDemand.getSpecificTocka(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Tocka obj = data.get(index);
        Long id = obj.getId();
        return Tocka.findTocka(id);
    }
    
    public Tocka TockaDataOnDemand.getRandomTocka() {
        init();
        Tocka obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Tocka.findTocka(id);
    }
    
    public boolean TockaDataOnDemand.modifyTocka(Tocka obj) {
        return false;
    }
    
    public void TockaDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Tocka.findTockaEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Tocka' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Tocka>();
        for (int i = 0; i < 10; i++) {
            Tocka obj = getNewTransientTocka(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
