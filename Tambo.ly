\version "2.12.3"

\include "include/defs.lyi"
\include "include/tambo.lyi"

instrument = "Tambourine"

\include "include/header.lyi"
\include "include/part.lyi"

\book
{
  \score
  {
		\new RhythmicStaff
		{
			\override NoteHead #'style = #'cross
      \set Score.skipBars = ##t
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 16)
			<< \tambo \outline >>
		}
  }
}

