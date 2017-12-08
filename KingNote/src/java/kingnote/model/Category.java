package kingnote.model;

import java.util.UUID;

public class Category {

    private String id;
    private String name;
    private String color;

    /**
     * construtor da categoria, o id é gerado aleatoriamente
     *
     * @param name
     * @param color
     */
    public Category(String name, String color) {
        this.id = UUID.randomUUID().toString();
        this.name = name;
        this.color = color;
    }

    /**
     * retorna o id da categoria
     *
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * retorna o nome da categoria
     *
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * seta o nome da categoria
     *
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * retorna a cor da categoria
     *
     * @return the color
     */
    public String getColor() {
        return color;
    }

    /**
     * seta a cor da categoria
     *
     * @param color the color to set
     */
    public void setColor(String color) {
        this.color = color;
    }

}
