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
public class Book {

    private String BookId,
            Title,
            Author,
            MainClassification,
            SubClassification,
            MainClassificationName,
            SubClassificationName,
            YearOfPublishing,
            ISBN;

    public String getBookId() {
        return BookId;
    }

    public void setBookId(String BookId) {
        this.BookId = BookId;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public String getAuthor() {
        return Author;
    }

    public void setAuthor(String Author) {
        this.Author = Author;
    }

    public String getMainClassification() {
        return MainClassification;
    }

    public void setMainClassification(String MainClassification) {
        this.MainClassification = MainClassification;
    }

    public String getSubClassification() {
        return SubClassification;
    }

    public void setSubClassification(String SubClassification) {
        this.SubClassification = SubClassification;
    }

    public String getMainClassificationName() {
        return MainClassificationName;
    }

    public void setMainClassificationName(String MainClassificationName) {
        this.MainClassificationName = MainClassificationName;
    }

    public String getSubClassificationName() {
        return SubClassificationName;
    }

    public void setSubClassificationName(String SubClassificationName) {
        this.SubClassificationName = SubClassificationName;
    }

    public String getYearOfPublishing() {
        return YearOfPublishing;
    }

    public void setYearOfPublishing(String YearOfPublishing) {
        this.YearOfPublishing = YearOfPublishing;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

}
