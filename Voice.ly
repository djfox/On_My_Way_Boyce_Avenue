\version "2.12.3"

\include "include/defs.lyi"
\include "include/lyrics.lyi"
\include "include/voice.lyi"

instrument = "Voice"

\include "include/header.lyi"
\include "include/part.lyi"

\book
{
  \score
  {
		<<
			\new Voice = "singer" \with { \consists "Ambitus_engraver" }
			{
				\clef treble
				\key d \major
				<< \theVoice \outline >>
			}
			\new Lyrics = "singerLyrics"
			{
				\context Lyrics = singerLyrics\lyricsto "singer"
				\voiceLyrics	
			}
		>>
  }
}
