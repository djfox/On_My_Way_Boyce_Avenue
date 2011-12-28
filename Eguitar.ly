\version "2.12.3"

\include "include/defs.lyi"
\include "include/eguitar.lyi"

instrument = "Electric guitar"

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
				<< \eguitar \outline >>
			}
			\new TabStaff
			{
				\key d \major
				\eguitar
			}
		>>
  }
}

