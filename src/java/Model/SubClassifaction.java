/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Mathan
 */
public class SubClassifaction {
    String  subClassificationId,
            subClassificationName,
            mainClassificationId, 
            mainClassificationName;

    public String getSubClassificationId() {
        return subClassificationId;
    }

    public void setSubClassificationId(String subClassificationId) {
        this.subClassificationId = subClassificationId;
    }

    public String getSubClassificationName() {
        return subClassificationName;
    }

    public void setSubClassificationName(String subClassificationName) {
        this.subClassificationName = subClassificationName;
    }

    public String getMainClassificationId() {
        return mainClassificationId;
    }

    public void setMainClassificationId(String mainClassificationId) {
        this.mainClassificationId = mainClassificationId;
    }

    public String getMainClassificationName() {
        return mainClassificationName;
    }

    public void setMainClassificationName(String mainClassificationName) {
        this.mainClassificationName = mainClassificationName;
    }

}
