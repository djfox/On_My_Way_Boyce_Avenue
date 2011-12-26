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
	\include "include/eguitar.ly"
}

aguitar =
{
	\override Staff.TimeSignature #'style = #'()
	\time 4/4
	\include "include/aguitar.ly"
}


\score
{
	<<
		%\override Score.VerticalAxisGroup #'remove-first = ##t

		\new Voice = "singer" \with { \consists "Ambitus_engraver" }
		{
			\clef treble
			\key d \major
			\override Staff.TimeSignature #'style = #'()
			\set Staff.instrumentName = "Voice"
			\set Staff.shortInstrumentName = "V"
			\set Staff.midiInstrument = "voice oohs"
			\time 4/4
			\include "include/voice.ly"
		}
		\new Lyrics = "singerLyrics"
		{
			\context Lyrics = singerLyrics\lyricsto "singer"
			\lyricmode
			{
				\include "include/lyrics.ly"
			}
		}
		\new PianoStaff
		<<
	
			\set PianoStaff.instrumentName = #"Piano"
			\set PianoStaff.shortInstrumentName = "P"
	
			%%%%%%%%%%%%%%%%% PIANO RIGHT HAND %%%%%%%%%%%%%%%%%
			\new Staff = "rightHand"
			{
				\override Score.MetronomeMark #'padding = #2.5
				\tempo 4=85
				\clef treble
				\key d \major
				\override Staff.TimeSignature #'style = #'()
				\time 4/4
				\include "include/pianoRightHand.ly"
			}
	
			%%%%%%%%%%%%%%%%% PIANO LEFT HAND %%%%%%%%%%%%%%%%%
			\new Staff = "leftHand"
			{
				\clef bass
				\key d \major
				\override Staff.TimeSignature #'style = #'()
				\time 4/4
				\set Staff.pedalSustainStyle = #'mixed
				\include "include/pianoLeftHand.ly"
			}
		>>



		%%% E. GUITAR %%%
		\new StaffGroup
		<<
			\set StaffGroup.instrumentName = #"E. guitar"
			\set StaffGroup.shortInstrumentName = "E. g"
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
			\set StaffGroup.shortInstrumentName = "A. g"
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
			\set Staff.shortInstrumentName = "T"
			\override Staff.TimeSignature #'style = #'()
			\time 4/4
			\include "include/tambo.ly"
		}
	>>
	\layout{}
	\midi{}
}
