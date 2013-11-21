// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.geoskola.gsp.klase;

import com.geoskola.gsp.klase.TipTocke;
import com.geoskola.gsp.klase.TipTockeDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect TipTockeDataOnDemand_Roo_DataOnDemand {
    
    declare @type: TipTockeDataOnDemand: @Component;
    
    private Random TipTockeDataOnDemand.rnd = new SecureRandom();
    
    private List<TipTocke> TipTockeDataOnDemand.data;
    
    public TipTocke TipTockeDataOnDemand.getNewTransientTipTocke(int index) {
        TipTocke obj = new TipTocke();
        setId(obj, index);
        setStabilizacija(obj, index);
        return obj;
    }
    
    public void TipTockeDataOnDemand.setId(TipTocke obj, int index) {
        int id = index;
        obj.setId(id);
    }
    
    public void TipTockeDataOnDemand.setStabilizacija(TipTocke obj, int index) {
        String stabilizacija = "stabilizacija_" + index;
        obj.setStabilizacija(stabilizacija);
    }
    
    public TipTocke TipTockeDataOnDemand.getSpecificTipTocke(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        TipTocke obj = data.get(index);
        Long id = obj.getId_();
        return TipTocke.findTipTocke(id);
    }
    
    public TipTocke TipTockeDataOnDemand.getRandomTipTocke() {
        init();
        TipTocke obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId_();
        return TipTocke.findTipTocke(id);
    }
    
    public boolean TipTockeDataOnDemand.modifyTipTocke(TipTocke obj) {
        return false;
    }
    
    public void TipTockeDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = TipTocke.findTipTockeEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'TipTocke' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<TipTocke>();
        for (int i = 0; i < 10; i++) {
            TipTocke obj = getNewTransientTipTocke(i);
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
