---
# Front matter
lang: ru-RU  
title: "Отчёт по лабораторной работе №3"
subtitle: "дисциплина: Математическое моделирование"  
author: "Пономарева Лилия Михайловна"  

# Generic options
lang: ru-RU
toc-title: "Содержание"

# Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

# Pdf output format
toc: true # Table of contents
toc_depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4paper
documentclass: scrreprt
## I18n
polyglossia-lang:
  name: russian
  options:
  - spelling=modern
  - babelshorthands=true
polyglossia-otherlangs:
  name: english
### Fonts
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Misc options
indent: true
header-includes:
  - \linepenalty=10 # the penalty added to the badness of each line within a paragraph (no associated penalty node) Increasing the value makes tex try to have fewer lines in the paragraph.
  - \interlinepenalty=0 # value of the penalty (node) added after each line of a paragraph.
  - \hyphenpenalty=50 # the penalty for line breaking at an automatically inserted hyphen
  - \exhyphenpenalty=50 # the penalty for line breaking at an explicit hyphen
  - \binoppenalty=700 # the penalty for breaking a line at a binary operator
  - \relpenalty=500 # the penalty for breaking a line at a relation
  - \clubpenalty=150 # extra penalty for breaking after first line of a paragraph
  - \widowpenalty=150 # extra penalty for breaking before last line of a paragraph
  - \displaywidowpenalty=50 # extra penalty for breaking before last line before a display math
  - \brokenpenalty=100 # extra penalty for page breaking after a hyphenated line
  - \predisplaypenalty=10000 # penalty for breaking before a display
  - \postdisplaypenalty=0 # penalty for breaking after a display
  - \floatingpenalty = 20000 # penalty for splitting an insertion (can only be split footnote in standard LaTeX)
  - \raggedbottom # or \flushbottom
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Рассмотреть построение простейших моделей боевых действий – моделей Ланчестера. 


# Теоретическое введение

Рассмотри три случая ведения боевых действий:

1. Боевые действия между регулярными войсками 
2. Боевые действия с участием регулярных войск и партизанских отрядов 
3. Боевые действия между партизанскими отрядами 

В первом случае численность регулярных войск определяется тремя факторами:

1. скорость уменьшения численности войск из-за причин, не связанных с боевыми действиями (болезни, травмы, дезертирство);
2. скорость потерь, обусловленных боевыми действиями противоборствующих сторон (что связанно с качеством стратегии, уровнем вооружения, профессионализмом солдат и т.п.);
3. скорость поступления подкрепления (задаётся некоторой функцией от времени). 

В этом случае модель боевых действий между регулярными войсками описывается следующим образом

$$
 \begin{cases}
	\frac{dx}{dt}= -a(t)x(t) - b(t)y(t) + P(t)
	\\   
	\frac{dy}{dt}= -c(t)x(t) - h(t)y(t) + Q(t)
 \end{cases}
$$

Потери, не связанные с боевыми действиями, описывают члены $–a(t)x(t)$ и $–h(t)y(t)$, члены $–b(t)y(t)$ и $–c(t)x(t)$ отражают потери на поле боя. Коэффициенты $b(t)$, $c(t)$ указывают на эффективность боевых действий со стороны $y$ и $x$ соответственно, $a(t)$,$h(t)$  - величины, характеризующие степень влияния различных факторов на потери. Функции $P(t)$,$Q(t)$  учитывают возможность подхода подкрепления к войскам $X$ и $Y$ в течение одного дня. 

Во втором случае в борьбу добавляются партизанские отряды. Нерегулярные войска в отличии от постоянной армии менее уязвимы, так как действуют скрытно, в этом случае сопернику приходится действовать неизбирательно, по площадям, занимаемым партизанами. Поэтому считается, что темп потерь партизан, проводящих свои операции в разных местах на некоторой известной территории, пропорционален не только численности армейских соединений, но и численности самих партизан. В результате модель принимает вид:

$$
 \begin{cases}
	\frac{dx}{dt}= -a(t)x(t) - b(t)y(t) + P(t)
	\\   
	\frac{dy}{dt}= -c(t)x(t)y(t) - h(t)y(t) + Q(t)
 \end{cases}
$$

Модель ведение боевых действий между партизанскими отрядами с учетом предположений, сделанном в предыдущем случаем, имеет вид:

$$
 \begin{cases}
	\frac{dx}{dt}= -a(t)x(t) - b(t)x(t)y(t) + P(t)
	\\   
	\frac{dy}{dt}= -h(t)y(t) - c(t)x(t)y(t) + Q(t)
 \end{cases}
$$

В простейшей модели борьбы двух противников коэффициенты $b(t)$ и $c(t)$ являются постоянными. Попросту говоря, предполагается, что каждый солдат армии $x$ убивает за единицу времени $c$ солдат армии $y$ (и, соответственно, каждый солдат армии $y$ убивает $b$ солдат армии $x$). Также не учитываются потери, не связанные с боевыми действиями, и возможность подхода подкрепления. Состояние системы описывается точкой $(x,y)$ положительного квадранта плоскости. Координаты этой точки, $x$ и $y$ - это численности противостоящих армий. Тогда модель принимает вид

$$
 \begin{cases}
	\frac{dx}{dt}= -by
	\\   
	\frac{dy}{dt}= -ax
 \end{cases}
$$

Это - жесткая модель, которая допускает точное решение

$\frac{dx}{dy}=\frac{by}{cx}$

$cxdx=bydy, cx^2 - by^2 = C$

Эволюция численностей армий x и y происходит вдоль гиперболы, заданной этим уравнением (рис. -@fig:001). По какой именно гиперболе пойдет война, зависит от начальной точки.

![Рисунок.1. Жесткая модель войны](../images/model1.png){ #fig:001 width=70% height=70% }

Эти гиперболы разделены прямой  $\sqrt{cx}=\sqrt{by}$. Если начальная точка лежит выше этой прямой, то гипербола выходит на ось $y$. Это значит, что в ходе войны численность армии $x$ уменьшается до нуля (за конечное время). Армия $y$ выигрывает, противник уничтожен. 
Если начальная точка лежит ниже, то выигрывает армия $x$. В разделяющем эти случаи состоянии (на прямой) война заканчивается истреблением обеих армий. Но на это требуется бесконечно большое время: конфликт продолжает тлеть, когда оба противника уже обессилены. 
Вывод модели таков: для борьбы с вдвое более многочисленным противником нужно в четыре раза более мощное оружие, с втрое более многочисленным - в девять раз и т. д. (на это указывают квадратные корни в уравнении прямой). 
Стоит помнить, что эта модель сильно идеализирована и неприменима к реальной ситуации. Но может использоваться для начального анализа. 
Если рассматривать второй случай (война между регулярными войсками и партизанскими отрядами) с теми же упрощениями, то модель принимает вид:

$$
 \begin{cases}
	\frac{dx}{dt}= -by(t)
	\\   
	\frac{dy}{dt}= -cx(t)y(t)
 \end{cases}
$$

Эта система приводится к уравнению $\frac{d}{dt}= (\frac{b}{2}x^2(t)-cy(t))=0$, которое при заданных начальных условиях имеет единственное решение:
$\frac{b}{2}x^2(t)-cy(t)=\frac{b}{2}x^2(0)-cy(0)=C_1$

![Рисунок.2. Фазовые траектории для второго случая](../images/model2.png){ #fig:002 width=70% height=70% }

Из Рисунка @fig:002 видно, что при $C_1>0$ побеждает регулярная армия, при $C_1<0$ побеждают партизаны. Аналогично противоборству регулярных войск, победа обеспечивается не только начальной численностью, но и боевой выручкой и качеством вооружения. При $C_1>0$  получаем соотношение  $\frac{b}{2}x^2(0)>cy(0)$ Чтобы одержать победу партизанам необходимо увеличить коэффициент $c$ и повысить свою начальную численность на соответствующую величину. Причем это увеличение, с ростом начальной численности регулярных войск $x(0)$ должно расти не линейно, а пропорционально второй степени $x(0)$ . Таким образом, можно сделать вывод, что регулярные войска находятся в более выгодном положении, так как неравенство для них выполняется при меньшем росте начальной численности войск.[[1]](#список-литературы)

# Задание

[Вариант 44]

Между страной Х и страной У идет война. Численность состава войск исчисляется от начала войны, и являются временными функциями x(t) и y(t). В начальный момент времени страна Х имеет армию численностью 38 000 человек, а  в распоряжении страны У армия численностью в 29 000 человек. Для упрощения модели считаем, что коэффициенты a, b, c, h постоянны. Также считаем P(t) и Q(t)непрерывные функции.
Постройте графики изменения численности войск армии Х и армии У для 
следующих случаев:
1. Модель боевых действий между регулярными войсками
$$
 \begin{cases}
	\frac{dx}{dt}= -0.41x(t) - 0.76y(t) + |sin(t + 3)|
	\\   
	\frac{dy}{dt}= -0.59x(t) - 0.63y(t) + |cos(t + 2)|
 \end{cases}
$$

2. Модель ведение боевых действий с участием регулярных войск и партизанских отрядов
$$
 \begin{cases}
	\frac{dx}{dt}= -0.37x(t) - 0.76y(t) + |sin(6t)|
	\\   
	\frac{dy}{dt}= -0.32x(t)y(t) - 0.61y(t) + |cos(7t)|
 \end{cases}
$$

# Выполнение лабораторной работы

## Код программы 

1. Модель боевых действий между регулярными войсками

```
model Lab03
  parameter Real x0 = 38000;
  parameter Real y0 = 29000;
  
  parameter Real a = 0.41;
  parameter Real b = 0.76;
  parameter Real c = 0.59;
  parameter Real h = 0.63;
  
  Real x(start=x0);
  Real y(start=y0);
  
equation
  der(x) = -a*x - b*y + abs(sin(time + 3));
  der(y) = -c*x - h*y + abs(cos(time + 2));
  
end Lab03;
```

2. Модель ведение боевых действий с участием регулярных войск и партизанских отрядов
```
model Lab03_2
  parameter Real x0 = 38000;
  parameter Real y0 = 29000;
  
  parameter Real a = 0.37;
  parameter Real b = 0.76;
  parameter Real c = 0.32;
  parameter Real h = 0.61;
  
  Real x(start=x0);
  Real y(start=y0);
  
equation
  der(x) = -a*x - b*y + abs(sin(6*time));
  der(y) = -c*x - h*y + abs(cos(7*time));
  
end Lab03_2;
```

## Полученные графики  
После запуска кода программы получили следующие графики для первого и второго случая соответственно  (см. рис. -@fig:003 и -@fig:004).

![Рисунок 3. Модель боевых действий между регулярными войсками](../images/1.png){ #fig:003 width=70% } 

![Рисунок 4. Модель ведение боевых действий с участием регулярных войск и партизанских отрядов](../images/2.png){ #fig:004 width=70% } 

В обоих случаях победу одерживает армия X: в первом случае за время 1.5 секунд, во втором за 3.3 секунды.

# Вывод

В результате проделанной работы мы познакомились с моделями Ланчестера, а также научись пользоваться программными средствами OpenModelica.

# Список литературы {.unnumbered}

1. [Зенкин В.И. Курс математического и компьютерного моделирования](https://books.google.ru/books?id=ueNmBgAAQBAJ&pg=PA70&lpg=PA70&dq=%D0%BC%D0%BE%D0%B4%D0%B5%D0%BB%D1%8C+%D0%BE%D1%81%D0%B8%D0%BF%D0%BE%D0%B2%D0%B0-%D0%BB%D0%B0%D0%BD%D1%87%D0%B5%D1%81%D1%82%D0%B5%D1%80%D0%B0&source=bl&ots=dqqdPEN_Bo&sig=ROagXVs6aJDca47OidUj7BMOyMk&hl=ru&sa=X&ved=0CD0Q6AEwBWoVChMItZGuyKqzxwIVC6dyCh0Haw0x#v=onepage&q=%D0%BC%D0%BE%D0%B4%D0%B5%D0%BB%D1%8C%20%D0%BE%D1%81%D0%B8%D0%BF%D0%BE%D0%B2%D0%B0-%D0%BB%D0%B0%D0%BD%D1%87%D0%B5%D1%81%D1%82%D0%B5%D1%80%D0%B0&f=false)
2. [Документация по системе Modelica](https://www.modelica.org/)