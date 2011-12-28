% INTRO %
<a' d'' fis''>1																								%1
<a' cis'' e''>																								%2
<g' b' d''>																										%3
<fis' a' d''>2 <e' a' cis''>2 \bar "||"												%4
				


% VERSE 1 %
\repeat unfold 2
{
	<<
	{
		\voiceOne
		<d'' fis''>2. d''4																				%5
		<cis'' e''>2. cis''4																			%6
		<b' d''>2. a'4																						%7
	}
	\new Voice
	{
		\voiceTwo
		a'1																												%5
		a'																												%6
		g'																												%7
	}
	>>
	\oneVoice
	<fis' a' d''>2 <e' a' cis''>2																%12
} \bar "||"

	

% CHORUS 1 %
\repeat unfold 2
{
	<<
	{	\voiceOne
		g'2. a'4																									%13
		<d' fis'>2~ <d' fis'>8 d' e'4															%14
		fis'2~ fis'8 b fis'4																			%15
	}
	\new Voice
	{
		\voiceTwo
		<b d'>1																										%13
		a																													%14
		<a d'>																										%15
	}
	>>
	\oneVoice
	<e' a'>4. <d' a'>8~ <d' a'>4 <cis' a'>											%16
}
<b g'>4. s8 s2																								%21
\change Staff="leftHand"																			
g,8[ d g]																											%22
\change Staff="rightHand"
<d' fis' a'>8~ <d' fis' a'> <a cis' e'>~ <a cis' e'>4					%22
\bar "||"

% VERSE 2 %
\repeat unfold 2
{
<<
{ \voiceOne
	fis'2. fis'4																								%23
	e'2. e'4																										%24
	d'2. a4																											%25
}
\new Voice
{
	\voiceTwo
	<a d'>1																											%23
	<a cis'>																										%24
	<g b>																												%25
}
>>
\oneVoice
<fis a d'>2 <e a cis'>																				%26
}
\bar "||"


% CHORUS 2 %
<b d' g'>4. d'8 d''4 cis''																		%31
<a d' fis'>4. d'8 a' b e' b																		%32
<a d' fis'>4. b8 d' e' fis'4																	%33
<e' a'>4. <d' a'>8~ <d' a'>4 <cis' a'>												%34

<b d' g'>4. d'8 d''4 cis''																		%35
<a d' fis'>4. d'8 a' b e' b																		%36
<a d' fis'>4. b8 d' e' fis'4																	%37
<e' a'>4. <d' a'>8~ <d' a'>4 <cis' a'>												%38
<b g'>4. s8 s2																								%39
\change Staff="leftHand"
g,8[ d g]																											%40
\change Staff="rightHand"
<d' fis' a'>8~ <d' fis' a'> <a cis' e'>~ <a cis' e'>4					%40
\bar "||"


% VERSE 3 %
\repeat unfold 2
{
	\repeat unfold 4 {<b d' g'>8 r}															%41
	\repeat unfold 3 {<a d' fis'>8 r} <a cis' e'>8 r						%42
	\repeat unfold 4 {<d' fis' a'>8 r}													%43
	\repeat unfold 4 {<cis' e' a'>8 r}													%44
}
