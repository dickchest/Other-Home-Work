package JavaProfessionalCourse.Lesson5.HomeWork5.Level2;

import javax.swing.*;
import java.awt.*;
import java.util.HashMap;
import java.util.Map;

public class SystemFrameSearch {
    public static void main(String args[]) {

        JFrame frame = new JFrame();
        frame.setTitle("System Search");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(500, 500);
        frame.setLocationRelativeTo(null);
        frame.setResizable(false);

        JPanel panel = new JPanel();
        frame.add(panel);
        panel.setLayout(new FlowLayout());
        panel.setBackground(Color.LIGHT_GRAY);

        JLabel label = new JLabel();

        JTextField txt = new JTextField(10);

        Map<String, String> mapFilms = new HashMap<>();
        mapFilms.put("Оно", "ужастик в котором участвует танциющий клоун ");
        mapFilms.put("Игра в имитацию", "Умный человек который строит машину Энигму");
        mapFilms.put("Король лев ", "Лев который хочет победить зло ");
        mapFilms.put("Матрица ", "Человек который хочет изменить мир ");
        mapFilms.put("Я легенда", "Человек который остался сам ");



        panel.add(label);
        //   System.out.println(mapFilms.);
        System.out.println(mapFilms.values().toArray()[0]);


        frame.setVisible(true);
    }
}
