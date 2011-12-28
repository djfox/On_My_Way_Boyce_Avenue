\version "2.12.3"

\include "include/defs.lyi"
\include "include/aguitar.lyi"
\include "include/eguitar.lyi"
\include "include/lyrics.lyi"
\include "include/pianoLeftHand.lyi"
\include "include/pianoRightHand.lyi"
\include "include/tambo.lyi"
\include "include/voice.lyi"

instrument = "Whole band"

\layout
{
	\context { \RemoveEmptyStaffContext }
	\context { \RemoveEmptyRhythmicStaffContext }
	\context { \RemoveEmptyTabStaffContext }
	\context { \StaffGroup \consists "Instrument_name_engraver" }
}

\include "include/header.lyi"

\paper
{
	#(set-paper-size "a4" 'landscape)
	%#(set-paper-size "a4")
  ragged-last-bottom = ##f
}

%\override Staff.TimeSignature #'style = #'()
%\override Score.MetronomeMark #'padding = #2.5
\book
{
	\score
	{
		<<
			%\override Score.VerticalAxisGroup #'remove-first = ##t

			\new Voice = "singer" \with { \consists "Ambitus_engraver" }
			{
				\clef treble
				\key d \major
				\set Staff.instrumentName = "Voice"
				\set Staff.shortInstrumentName = "V"
				\set Staff.midiInstrument = "voice oohs"
				\theVoice
			}
			\new Lyrics = "singerLyrics"
			{
				\context Lyrics = singerLyrics\lyricsto "singer"
				\voiceLyrics
			}


			\new PianoStaff
			<<

				\set PianoStaff.instrumentName = #"Piano"
				\set PianoStaff.shortInstrumentName = "P"

				%%%%%%%%%%%%%%%%% PIANO RIGHT HAND %%%%%%%%%%%%%%%%%
				\new Staff = "rightHand"
				{
					\clef treble
					\key d \major
					\pianoRightHand
				}

				%%%%%%%%%%%%%%%%% PIANO LEFT HAND %%%%%%%%%%%%%%%%%
				\new Staff = "leftHand"
				{
					\clef bass
					\key d \major
					\set Staff.pedalSustainStyle = #'mixed
					\pianoLeftHand
				}
			>>



			%%% E. GUITAR %%%
			\new StaffGroup
			<<
				\set StaffGroup.instrumentName = #"Electric guitar"
				\set StaffGroup.shortInstrumentName = "E. g"
				%\override StaffGroup.SystemStartBracket #'collapse-height = #20
				\new Staff
				{
					\key d \major
					\eguitar
				}
				\new TabStaff
				{
					\key d \major
					\eguitar
				}
			>>




			%%% ACOUSTIC GUITAR %%%
			\new StaffGroup
			<<
				\set StaffGroup.instrumentName = #"Acoustic guitar"
				\set StaffGroup.shortInstrumentName = "A. g"
				%\override StaffGroup.SystemStartBracket #'collapse-height = #20
				\new Staff
				{
					\key d \major
					\aguitar
				}
				\new TabStaff
				{
					\key d \major
					\aguitar
				}
			>>



			%%% TAMBO %%%
			\new RhythmicStaff
			{
				\set RhythmicStaff.instrumentName = #"Tambourine"
				\set Staff.shortInstrumentName = "T"
				\override NoteHead #'style = #'cross
				<< \tambo \outline >>
			}
		>>
		\layout{}
		\midi{}
	}
}
