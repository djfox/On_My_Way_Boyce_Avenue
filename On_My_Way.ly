\version "2.12.3"
\header
{
	title = "On My Way"
	composer = "Boyce Avenue"
	arranger = "Martin Wetterwald"
	tagline = ""
}

\paper
{
	%#(set-paper-size "a4" 'landscape)
	#(set-paper-size "a4")
}

\layout
{
	\context { \RemoveEmptyStaffContext }
	\context { \RemoveEmptyRhythmicStaffContext }
	\context { \RemoveEmptyTabStaffContext }
	\context { \StaffGroup \consists "Instrument_name_engraver" }
}

eguitar =
{
	\override Staff.TimeSignature #'style = #'()
	\key d \major
	\time 4/4
	
	s1*40
	a'8\2 a'\2 a'\2 a'\2 a'\2 a'16\2 b'\2~ b'8\2 b'16\2 fis'\2 fis'8\2
}

aguitar =
{
	\override Staff.TimeSignature #'style = #'()
	\time 4/4
	s1*15
}


\score
{
	<<
		%\override Score.VerticalAxisGroup #'remove-first = ##t

		\new Voice = "singer"
		{
			\clef treble
			\key d \major
			\override Staff.TimeSignature #'style = #'()
			\set Staff.instrumentName = "Voice"
			\set Staff.midiInstrument = "voice oohs"

			\time 4/4
			r1																															%1
			r1																															%2
			r1																															%3
			r1																															%4
			r4 r8. a'16 fis'' fis''8 fis''16 ~ fis''8 e''16 e''~						%5
			e''8 fis''8 r8. e''16 e'' fis''8 fis''8 e''16 cis'' d''~				%6
			d''2. r8 r32 a'16.																							%7
			e''16 fis''8 fis''8 r8 e''16~ e'' fis''8 fis''8 e''16 d''8~			%8

			d''4 r8. a'16 fis'' fis''8 fis''16~ fis''8 e''16 e''~						%9
			e''8 fis''8 r8. a'16 e'' fis''8 e'' cis''  d''16~								%10
			d''8																														%11
		}
		\new Lyrics = "singerLyrics"
		{
			\context Lyrics = singerLyrics\lyricsto "singer"
			\lyricmode
			{
				I wa- sn't the~re the mo- ment
				That you first le- arned to breathe
				But "I'm on" my way
				On my way - -
				I wa- sn't there the mo- ment
				That you got of your knees
			}
		}
		\new PianoStaff
		<<
	
			\set PianoStaff.instrumentName = #"Piano"
	
			%%%%%%%%%%%%%%%%% PIANO RIGHT HAND %%%%%%%%%%%%%%%%%
			\new Staff = "rightHand"
			{
				\override Score.MetronomeMark #'padding = #2.5
				\tempo 4=85
				\clef treble
				\key d \major
				\override Staff.TimeSignature #'style = #'()
				\time 4/4
	
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
					<fis' a' d''>2 <e' a' cis''>2																%12
				} \bar "||"
	


				% CHORUS %
				<<
				{	\voiceOne
					g'2. a'4																										%13
					<d' fis'>2~ <d' fis'>8 d' e'4																%14
					fis'2~ fis'8 b fis'4																				%15
				}
				\new Voice
				{
					\voiceTwo
					<b d'>1																											%13
					a																														%14
					<a d'>																											%15
				}
				>>
				<e' a'>4. <d' a'>8~ <d' a'>4 <cis' a'>												%16
				<<
				{
					\voiceOne
					g'2. a'4																										%17
					<d' fis'>2~ <d' fis'>8 d' e'4																%18
					fis'2~ fis'8 b fis'4																				%19
				}
				\new Voice
				{
					\voiceTwo
					<b d'>1																											%17
					a																														%18
					<a d'>																											%19
				}
				>>
				s1*2
				\bar "||"


			}
	
			%%%%%%%%%%%%%%%%% PIANO LEFT HAND %%%%%%%%%%%%%%%%%
			\new Staff = "leftHand"
			{
				\clef bass
				\key d \major
				\override Staff.TimeSignature #'style = #'()
				\time 4/4
				\set Staff.pedalSustainStyle = #'mixed
	
				% INTRO %
				d'1																														%1
				d'																														%2
				g																															%3
				b2 a																													%4
				
				% VERSE 1 %
				\repeat unfold 2
				{
					d'1																													%5
					d'																													%6
					g																														%7
					b2 a																												%8
				}
	
				% CHORUS 1%
				d1																														%13
				d																															%14
				b,																														%15
				a,8 e a2.																											%16
				d1																														%17
				d																															%18
				b,																														%19
				s1*3
			}
		>>



		%%% E. GUITAR %%%
		\new StaffGroup
		<<
			\set StaffGroup.instrumentName = #"E. guitar"
			%\override StaffGroup.SystemStartBracket #'collapse-height = #20
			%\set StaffGroup.systemStartDelimiter = #'SystemStartSquare
			\new Staff
			{
				\eguitar
			}
			\new TabStaff
			{
				\eguitar
			}
		>>




		%%% ACOUSTIC GUITAR %%%
		\new StaffGroup
		<<
			\set StaffGroup.instrumentName = #"Ac. guitar"
			%\override StaffGroup.SystemStartBracket #'collapse-height = #20
			%\set StaffGroup.systemStartDelimiter = #'SystemStartSquare
			\new Staff
			{
				\aguitar
			}
			\new TabStaff
			{
				\aguitar
			}
		>>



		%%% TAMBO %%%
		\new RhythmicStaff
		{
			\set RhythmicStaff.instrumentName = #"Tambo"
			\override Staff.TimeSignature #'style = #'()
			\time 4/4
			s1*30																														%1
			r2 r4 a																													%31
		}
	>>
	\layout{}
	\midi{}
}
