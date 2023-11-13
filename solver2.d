module solver2;

import std.stdio;
import std.conv;
import solver;
import std.format;
import student_list;
import student_score;

void solve_p3 (int nmk){
    //writeln(text("Courses: ", nmk));

    //mk_list = [""] * nmk
    //string[] mk_list = new string[nmk];
    //sks_list = [0] * nmk 
    //int[] sks_list = new int[nmk]; 
    //score_list = [0] * nmk
    //double[] score_list = new double[nmk];
    //alpha_score_list = mk_list.copy()
    //string[] grade_list = new string[nmk];
    /*double[string] contribution = [
    "A" : 4,
    "A-" : 3.7,
    "B+" : 3.3,
    "B" : 3, 
    "B-" : 2.7,
    "C+" : 2.3, 
    "C" : 2,
    "C-" : 1.7,
    "D" : 1,
    "E" : 0
    ];*/

    StudentScore[] student_score = new StudentList().constructList(nmk);

    for(int i=0;i<nmk;i++){
        writeln("Please enter Course Name, SKS Credit, Score separated by white space");
        //readf("%s %d %e\n", &mk_list[i], &sks_list[i], &score_list[i]);
        readf("%s %d %e\n", student_score[i].mk_name, student_score[i].sks, &student_score[i].score);
        
        //write("Course score: ");
        //readf("%f", &score_list);
        
    }
    /*print!(string).printArray(mk_list);
    print!(int).printArray(sks_list);
    print!(double).printArray(score_list);
    writeln("line reached successfully");*/

    writeln("Mata Kuliah \t SKS \t Nilai Angka \t Nilai Huruf \t Bobot");
    double ip = 0;
    int sum_sks = 0;
    for(int i=0;i<nmk;i++){
        StudentScore score = student_score[i];
        string grade = score.to_grade(score.score);
        double weight = score.to_contribution(grade);
        //writeln(format("%s \t %d \t %10.2f \t %s \t %10.2f \n", mk_list[i], 
        //    sks_list[i], score_list[i], grade, weight));
        writeln(format("%s \t %d \t %10.2f \t %s \t %10.2f \n", score.mk_name, 
            score.sks, score.score, grade, weight));
        ip += score.sks * weight;
        sum_sks += score.sks;
    }

    //printf("ip: %f\n ", ip);
    //printf("total sks: %f", sum_sks);
    double result = ip / sum_sks;
    writeln(text("Indeks Prestasi (IP): ", result));
}

string to_grade(double d){
    if(d <= 45){
        return "E";
    }
    else if(45 < d && d <= 50)
        return "D";
    else if(50 < d && d <= 55)
        return "C-";
    else if(55 < d && d <= 60)
        return "C";
    else if(60 < d && d<= 65)
        return "C+";
    else if(65 < d && d <= 70)
        return "B-";
    else if(70 < d && d <=  75)
        return "B";
    else if(75 < d && d <= 80)
        return "B+";
    else if(80 < d && d <= 85)
        return "A-";
    else
        return "A";
}