package kingnote.model;

import java.util.UUID;

public class Category {

    private String id;
    private String name;
    private String color;

    public Category(String name, String color) {
        this.id = UUID.randomUUID().toString();
        this.name = name;
        this.color = color;
    }

    /**
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the color
     */
    public String getColor() {
        return color;
    }

    /**
     * @param color the color to set
     */
    public void setColor(String color) {
        this.color = color;
    }

}
