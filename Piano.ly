\version "2.12.3"

\include "include/defs.lyi"
\include "include/pianoLeftHand.lyi"
\include "include/pianoRightHand.lyi"

instrument = "Piano"

\include "include/header.lyi"
\include "include/part.lyi"

\book
{
  \score
  {
		\new PianoStaff
		<<

			\new Staff = "rightHand"
			{
				\set Score.skipBars = ##t
				\clef treble
				\key d \major \pianoRightHand
			}

			\new Staff = "leftHand"
			{
				\clef bass
				\set Staff.pedalSustainStyle = #'mixed
				<< \key d \major \pianoLeftHand \outline >>
			}
		>>
		\layout{}
		\midi{}
  }
}

