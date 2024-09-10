<?php

//변수(variable)
$dan = 1;
echo "$dan x 1 = 2\n";
echo "$dan x 2 = 4\n";
echo "$dan x 3 = 6\n";
echo "$dan x 4 = 8\n";
echo "$dan x 5 = 10\n";


//변수 선언
$num;

//변수 초기화
$num = 1;

//변수 선언 및 초기화
$str = "가나다";


//스네이크 기법
$user_name;

//상수(contants)
$userName;

//상수(constrants) : 절대 변하지 않는 값 
define("AGE", 20);
echo AGE;
//define("AGE", 30); //이미 선언된 상수이므로 warning이 일어나고 값이 바뀌지 않는다. 

$name = "미어켓";
echo $name;
$name = "고양이";
echo $name;

//underscore 표기법
$num = 10_000_000;
echo $num;


//아래처럼 변수 값을 담아서 출력해주세요. 

$menu = "점심메뉴\n";
$tang = "탕수육 8,000\n";
$zza = "짜짱면 6,000\n";
$zzam = "짬뽕 6,000\n"; 
echo $mune, $tang, $zza, $zzam;

// 두 변수의 스왑
$num1 = 200;
$num2 = 10;
$tmp;

$tmp = $num1;
$num1 = $num2;
$num2 = $tmp;
echo $num1, $num2;

//데이터 타입

// int : 숫자
$num = 1;
var_dump($num);

// double : 실수
$double = 3.141592;
var_dump($double);

// stirng : 문자열
$str = "abc가나다";
var_dump($str);

// boolean : 논리(참/거짓)
$boo = true;
var_dump($boo);

// NULL
$null = null;

// array : 배열
$arr = [1, 2, 3];
var_dump($arr);

// object : 객체
$obj = new datetime();
var_dump($obj);

// 형변환 : 변수 앞에 (데이터타입)$num
$casting = (string)$num;
var_dump($casting);

