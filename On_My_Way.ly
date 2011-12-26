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
			r1 r1 r1 r1 r4 r8. a'16 fis'' fis''8 fis''16 ~ fis''8 e''16 e''~
			e''8 fis''8 r8. e''16 e'' fis''8 fis''8 e''16 cis'' d''~
			d''2. r8 r32 a'16.
			e''16 fis''8 fis''8 r8 e''16~ e'' fis''8 fis''8 e''16 d''8~

			d''4 r8. a'16 fis'' fis''8 fis''16~ fis''8 e''16 e''~
			e''8 fis''8 r8. a'16 e'' fis''8 e'' cis''  d''16~
			d''8
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
	
			%%%%%%%%%%%%%%%%% PIANO MAIN DROITE %%%%%%%%%%%%%%%%%
			\new Staff = "droite"
			{
				\override Score.MetronomeMark #'padding = #2.5
				\tempo 4=85
				\clef treble
				\key d \major
				\override Staff.TimeSignature #'style = #'()
				\time 4/4
	
				% INTRO %
				<a' d'' fis''>1
				<a' cis'' e''>
				<g' b' d''>
				<fis' a' d''>2 <e' a' cis''>2 \bar "||"
				


				% VERSE 1 %
				\repeat unfold 2
				{
					<<
					{
						\voiceOne
						<d'' fis''>2. d''4
						<cis'' e''>2. cis''4
						<b' d''>2. a'4
					}
					\new Voice
					{
						\voiceTwo
						a'1
						a'
						g'
					}
					>>
					<fis' a' d''>2 <e' a' cis''>2
				} \bar "||"
	


				% CHORUS %
				<<
				{	\voiceOne
					g'2. a'4
					<d' fis'>2~ <d' fis'>8 d' e'4
					fis'2~ fis'8 b fis'4
				}
				\new Voice
				{
					\voiceTwo
					<b d'>1
					a
					<a d'>
				}
				>>
				<e' a'>4. <d' a'>8~ <d' a'>4 <cis' a'>
				<<
				{
					\voiceOne
					g'2. a'4
					<d' fis'>2~ <d' fis'>8 d' e'4
					fis'2~ fis'8 b fis'4
				}
				\new Voice
				{
					\voiceTwo
					<b d'>1
					a
					<a d'>
				}
				>>
				s1*2
				\bar "||"


			}
	
			%%%%%%%%%%%%%%%%% PIANO MAIN GAUCHE %%%%%%%%%%%%%%%%%
			\new Staff = "gauche"
			{
				\clef bass
				\key d \major
				\override Staff.TimeSignature #'style = #'()
				\time 4/4
				\set Staff.pedalSustainStyle = #'mixed
	
				% INTRO %
				d'1
				d'
				g
				b2 a
				
				% VERSE 1 %
				\repeat unfold 2
				{
					d'1
					d'
					g
					b2 a
				}
	
				% CHORUS 1%
				d1
				d
				b,
				a,8 e a2.
				d1
				d
				b,
				s1*3
			}
		>>

		%%% Guitare électrique %%%
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

		%%% Guitare accoustique %%%
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

		\new RhythmicStaff
		{
			\set RhythmicStaff.instrumentName = #"Tambo"
			\override Staff.TimeSignature #'style = #'()
			\time 4/4
			s1*30 r2 r4 a
		}
	>>
	\layout{}
	\midi{}
}
