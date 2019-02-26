---
title: Regulære Udtryk
course: SS
session: 3
date: 27-02-2019
---

# Regulære Udtryk

Regulære udtryk og NFA'er er ækvivalente.

Man taler om regulære udtryk over et alfabet.



**Basis-udtryk**

| Regulært udtryk R | Sproget betegnet af R, L(R) |
| ----------------- | --------------------------- |
| a $[a\in \Sigma]$ | {a}                         |
| Ø                 | {}                          |
| $\varepsilon$     | {$\varepsilon$}             |

**Sammensatte udtryk**

| Regulært udtryk R | Sproget betegnet af R, L(R) |
| ----------------- | --------------------------- |
| $(R_1\cup R_2)$   | $L(R_1) \cup L(R_2)$        |
| $(R_1 \circ R_2)$ | $L(R_1) \circ L(R_2)$       |
| $R^*$             | $L(R)^*$                    |



## Regulære Udtryk er Ækvivalente med NFA'er

**Eksempel:**
$$
(aa \space \cup \space b)^*
$$
Kan tegnes som NFA:

<svg width="800" height="400" version="1.1" xmlns="http://www.w3.org/2000/svg">
	<ellipse stroke="black" stroke-width="1" fill="none" cx="101.5" cy="224.5" rx="30" ry="30"/>
	<ellipse stroke="black" stroke-width="1" fill="none" cx="101.5" cy="224.5" rx="24" ry="24"/>
	<ellipse stroke="black" stroke-width="1" fill="none" cx="234.5" cy="224.5" rx="30" ry="30"/>
	<ellipse stroke="black" stroke-width="1" fill="none" cx="380.5" cy="134.5" rx="30" ry="30"/>
	<ellipse stroke="black" stroke-width="1" fill="none" cx="380.5" cy="305.5" rx="30" ry="30"/>
	<ellipse stroke="black" stroke-width="1" fill="none" cx="484.5" cy="134.5" rx="30" ry="30"/>
	<ellipse stroke="black" stroke-width="1" fill="none" cx="586.5" cy="134.5" rx="30" ry="30"/>
	<ellipse stroke="black" stroke-width="1" fill="none" cx="685.5" cy="134.5" rx="30" ry="30"/>
	<ellipse stroke="black" stroke-width="1" fill="none" cx="685.5" cy="134.5" rx="24" ry="24"/>
	<ellipse stroke="black" stroke-width="1" fill="none" cx="484.5" cy="305.5" rx="30" ry="30"/>
	<ellipse stroke="black" stroke-width="1" fill="none" cx="484.5" cy="305.5" rx="24" ry="24"/>
	<polygon stroke="black" stroke-width="1" points="27.5,224.5 71.5,224.5"/>
	<polygon fill="black" stroke-width="1" points="71.5,224.5 63.5,219.5 63.5,229.5"/>
	<polygon stroke="black" stroke-width="1" points="131.5,224.5 204.5,224.5"/>
	<polygon fill="black" stroke-width="1" points="204.5,224.5 196.5,219.5 196.5,229.5"/>
	<text x="163.5" y="245.5" font-family="Times New Roman" font-size="20">&#949;</text>
	<polygon stroke="black" stroke-width="1" points="260.038,208.758 354.962,150.242"/>
	<polygon fill="black" stroke-width="1" points="354.962,150.242 345.528,150.184 350.776,158.697"/>
	<text x="312.5" y="200.5" font-family="Times New Roman" font-size="20">&#949;</text>
	<polygon stroke="black" stroke-width="1" points="260.733,239.054 354.267,290.946"/>
	<polygon fill="black" stroke-width="1" points="354.267,290.946 349.697,282.693 344.846,291.437"/>
	<text x="294.5" y="286.5" font-family="Times New Roman" font-size="20">&#949;</text>
	<polygon stroke="black" stroke-width="1" points="410.5,134.5 454.5,134.5"/>
	<polygon fill="black" stroke-width="1" points="454.5,134.5 446.5,129.5 446.5,139.5"/>
	<text x="428.5" y="155.5" font-family="Times New Roman" font-size="20">a</text>
	<polygon stroke="black" stroke-width="1" points="514.5,134.5 556.5,134.5"/>
	<polygon fill="black" stroke-width="1" points="556.5,134.5 548.5,129.5 548.5,139.5"/>
	<text x="531.5" y="155.5" font-family="Times New Roman" font-size="20">&#949;</text>
	<polygon stroke="black" stroke-width="1" points="616.5,134.5 655.5,134.5"/>
	<polygon fill="black" stroke-width="1" points="655.5,134.5 647.5,129.5 647.5,139.5"/>
	<text x="631.5" y="155.5" font-family="Times New Roman" font-size="20">a</text>
	<path stroke="black" stroke-width="1" fill="none" d="M 247.955,197.703 A 280.306,280.306 0 0 1 662.79,114.92"/>
	<polygon fill="black" stroke-width="1" points="247.955,197.703 256.264,193.235 247.58,188.276"/>
	<text x="427.5" y="52.5" font-family="Times New Roman" font-size="20">&#949;</text>
	<polygon stroke="black" stroke-width="1" points="410.5,305.5 454.5,305.5"/>
	<polygon fill="black" stroke-width="1" points="454.5,305.5 446.5,300.5 446.5,310.5"/>
	<text x="427.5" y="326.5" font-family="Times New Roman" font-size="20">b</text>
	<path stroke="black" stroke-width="1" fill="none" d="M 463.658,326.998 A 139.843,139.843 0 0 1 238.775,254.136"/>
	<polygon fill="black" stroke-width="1" points="238.775,254.136 235.914,263.126 245.602,260.647"/>
	<text x="318.5" y="373.5" font-family="Times New Roman" font-size="20">&#949;</text>
</svg>

Og som vi så i [Lektion 2](../SS/2-nondertiminstiske-endelige-automater.md#kvivalens-mellem-dfa-og-nfa), så kan en NFA skrives om til en DFA.

