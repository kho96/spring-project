package com.kh.project.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class MovieVo {
    private int movie_no;
    private String movie_title;
    private String movie_story;
    private String posters;
    private String staff_list;
    private String genre;
    private String rating;
    private String runtime;
    private String release_date;
    private String score;
    private String status;
}
