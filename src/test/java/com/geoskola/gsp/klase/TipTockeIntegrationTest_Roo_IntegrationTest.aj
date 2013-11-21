// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.geoskola.gsp.klase;

import com.geoskola.gsp.klase.TipTocke;
import com.geoskola.gsp.klase.TipTockeDataOnDemand;
import com.geoskola.gsp.klase.TipTockeIntegrationTest;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect TipTockeIntegrationTest_Roo_IntegrationTest {
    
    declare @type: TipTockeIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: TipTockeIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: TipTockeIntegrationTest: @Transactional;
    
    @Autowired
    TipTockeDataOnDemand TipTockeIntegrationTest.dod;
    
    @Test
    public void TipTockeIntegrationTest.testCountTipTockes() {
        Assert.assertNotNull("Data on demand for 'TipTocke' failed to initialize correctly", dod.getRandomTipTocke());
        long count = TipTocke.countTipTockes();
        Assert.assertTrue("Counter for 'TipTocke' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void TipTockeIntegrationTest.testFindTipTocke() {
        TipTocke obj = dod.getRandomTipTocke();
        Assert.assertNotNull("Data on demand for 'TipTocke' failed to initialize correctly", obj);
        Long id = obj.getId_();
        Assert.assertNotNull("Data on demand for 'TipTocke' failed to provide an identifier", id);
        obj = TipTocke.findTipTocke(id);
        Assert.assertNotNull("Find method for 'TipTocke' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'TipTocke' returned the incorrect identifier", id, obj.getId_());
    }
    
    @Test
    public void TipTockeIntegrationTest.testFindAllTipTockes() {
        Assert.assertNotNull("Data on demand for 'TipTocke' failed to initialize correctly", dod.getRandomTipTocke());
        long count = TipTocke.countTipTockes();
        Assert.assertTrue("Too expensive to perform a find all test for 'TipTocke', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<TipTocke> result = TipTocke.findAllTipTockes();
        Assert.assertNotNull("Find all method for 'TipTocke' illegally returned null", result);
        Assert.assertTrue("Find all method for 'TipTocke' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void TipTockeIntegrationTest.testFindTipTockeEntries() {
        Assert.assertNotNull("Data on demand for 'TipTocke' failed to initialize correctly", dod.getRandomTipTocke());
        long count = TipTocke.countTipTockes();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<TipTocke> result = TipTocke.findTipTockeEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'TipTocke' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'TipTocke' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void TipTockeIntegrationTest.testFlush() {
        TipTocke obj = dod.getRandomTipTocke();
        Assert.assertNotNull("Data on demand for 'TipTocke' failed to initialize correctly", obj);
        Long id = obj.getId_();
        Assert.assertNotNull("Data on demand for 'TipTocke' failed to provide an identifier", id);
        obj = TipTocke.findTipTocke(id);
        Assert.assertNotNull("Find method for 'TipTocke' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyTipTocke(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'TipTocke' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void TipTockeIntegrationTest.testMergeUpdate() {
        TipTocke obj = dod.getRandomTipTocke();
        Assert.assertNotNull("Data on demand for 'TipTocke' failed to initialize correctly", obj);
        Long id = obj.getId_();
        Assert.assertNotNull("Data on demand for 'TipTocke' failed to provide an identifier", id);
        obj = TipTocke.findTipTocke(id);
        boolean modified =  dod.modifyTipTocke(obj);
        Integer currentVersion = obj.getVersion();
        TipTocke merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId_(), id);
        Assert.assertTrue("Version for 'TipTocke' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void TipTockeIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'TipTocke' failed to initialize correctly", dod.getRandomTipTocke());
        TipTocke obj = dod.getNewTransientTipTocke(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'TipTocke' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'TipTocke' identifier to be null", obj.getId_());
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
        Assert.assertNotNull("Expected 'TipTocke' identifier to no longer be null", obj.getId_());
    }
    
    @Test
    public void TipTockeIntegrationTest.testRemove() {
        TipTocke obj = dod.getRandomTipTocke();
        Assert.assertNotNull("Data on demand for 'TipTocke' failed to initialize correctly", obj);
        Long id = obj.getId_();
        Assert.assertNotNull("Data on demand for 'TipTocke' failed to provide an identifier", id);
        obj = TipTocke.findTipTocke(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'TipTocke' with identifier '" + id + "'", TipTocke.findTipTocke(id));
    }
    
}