---
marp: true
theme: gaia
math: katex
---
# Лабораторная работа №4
## Модель гармонических колебаний

Выполнила: Пономарева Лилия Михайловна
НПИбд-02-19
___
# Цель работы
Рассмотреть построение фазового портрета и решения уравнения гармонического осциллятора.
___
# Задание
Построить фазовый портрет гармонического осциллятора и решения уравнения для следующих случаев:
1. Колебания гармонического осциллятора без затуханий и без действий внешней силы.
2. Колебания гармонического осциллятора c затуханием и без действий внешней силы.
3. Колебания гармонического осциллятора c затуханием и под действием внешней силы.
___
# Случай 1
Уравнение $\ddot{x}+6.6x=0$

Это уравнение второго порядка представим в виде системы двух уравнений первого порядка:
$$
 \begin{cases}
	\dot{x}=y
	\\   
	\dot{y}=-6.6x
 \end{cases}
$$
На интервале $t \in [0;52]$, шаг $0.05$, $x_0=1, y_0=-1.5$
___
# Код
```
model lab04_1
  parameter Real w = 6.6;
  Real x(start=1);
  Real y(start=-1.5);
  
equation
    der(x)= y;
    der(y)= -w*x;

  annotation(experiment(StartTime=0, StopTime=52, Tplerance=1e06, Interval=0.05));
end lab04_1;
```
___
# График решения
![График решения уравнения гармонического осциллятора без затуханий, без действия внешней силы](../image/1.png)

___
# Фазовый портрет
![Фазовый портрет гармонического осциллятора без затуханий, без 
действия внешней силы по горизонтальной оси значения x, по вертикальной оси значения x'](../image/2.png)
___
# Случай 2
Уравнение
$$\ddot{x}+9\dot{x}+2x=0$$

Это уравнение второго порядка представим в виде системы двух уравнений первого порядка:
$$
 \begin{cases}
	\dot{x}=y
	\\   
	\dot{y}=-9y-2x
 \end{cases}
$$
___
# Код
```
model lab04_2
  parameter Real w = 2;
  parameter Real g = 9;
  Real x(start=1);
  Real y(start=-1.5);
  
equation
    der(x)= y;
    der(y)= -g*y-w*x;

annotation(experiment(StartTime=0, StopTime=52, Tplerance=1e-06,Interval=0.05));

end lab04_2;
```
___
# График решения
![Рисунок 2.1 График решения уравнения гармонического осциллятора с затуханием, без 
действия внешней силы](../image/3.png)
___
# Фазовый портрет
![Рисунок 2.2 Фазовый портрет гармонического осциллятора c затуханием, без 
действия внешней силы по горизонтальной оси значения x, по вертикальной оси значения x'](../image/4.png)

___
# Случай 3
Уравнение 
$$\ddot{x}+2.4\dot{x}+6x=0.2\cos{3t}$$

Это уравнение второго порядка представим в виде системы двух уравнений первого порядка:
$$
 \begin{cases}
	\dot{x}=y
	\\   
	\dot{y}=0.2\cos{3t}-2.4y-6x
 \end{cases}
$$
___
# Код 
```
model lab04_3
  parameter Real w = 6;
  parameter Real g = 2.4;
  Real x(start=1);
  Real y(start=-1.5);
  
  equation
    der(x)= y;
    der(y)= 0.2*cos(3*time)-g*y-w*x;

  annotation(experiment(StartTime=0, StopTime=52, Tplerance=1e-06,Interval=0.05));

end lab04_3;
```
___
# График решения
![Рисунок 3.1 График решения уравнения гармонического осциллятора с затуханием, под 
действием внешней силы](../image/5.png)
___
# Фазовый портрет
![Рисунок 3.2 Фазовый портрет гармонического осциллятора с затуханием, под 
действием внешней силы по горизонтальной оси значения x, по вертикальной оси значения x'](../image/6.png)
___
# Вывод

В ходе выполнения лабораторной работы были построены решения уравнения гармонического осциллятора и фазовые портреты гармонических колебаний без затухания, с затуханием и под действием внешней силы.
___
# Список литературы

1. [И. Ю. Щеглова, А. А. Богуславский моделирование колебательных процессов (на примере физических задач) Компьютерная поддержка курса "Колебания и волны", Коломна, 2009](http://window.edu.ru/resource/439/62439/files/%D0%9C%D0%BE%D0%B4%D0%B5%D0%BB%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%20%D0%BA%D0%BE%D0%BB%D0%B5%D0%B1%D0%B0%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D1%8B%D1%85%20%D0%BF%D1%80%D0%BE%D1%86%D0%B5%D1%81%D1%81%D0%BE%D0%B2.pdf)
2. [Документация по системе Modelica](https://www.modelica.org/)