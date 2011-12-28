\version "2.12.3"

\include "include/defs.lyi"
\include "include/aguitar.lyi"

instrument = "Acoustic guitar"

\include "include/header.lyi"
\include "include/part.lyi"

\book
{
  \score
  {
		\new StaffGroup
		<<
			\new Staff
			{
				\key d \major
				<< \aguitar \outline >>
			}
			\new TabStaff
			{
				\key d \major
				\aguitar
			}
		>>
  }
}

