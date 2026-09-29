#import "lib.typ": resume

#resume((
  header: (
    name: "foo",
    phone: "(123) 456-7890",
    location: "Boston, MA",
    email: "foo@bar.com",
    github: "https://github.com/foo",
    linkedin: "https://www.linkedin.com/in/foo",
    website: "https://foo.bar",
  ),

  education: (
    (
      name: "Northeastern University",
      location: "Boston, MA",
      degree: "Bachelor of Science, Computer Science",
      dates: (start: "Sep 2022", end: "May 2026"),
      description: (
        "GPA: 4.0/4.0 | Dean's List",
        "Relevant Coursework: Data Structures, Algorithms, Compilers, Operating Systems",
      ),
    ),
  ),

  experience: (
    (
      role: "Software Engineer",
      company: "Some Company",
      location: "Boston, MA",
      dates: (start: "Jun 2025"), // no `end` means Present
      description: (
        "I did something cool",
        "This is another bullet point of something I did",
        ("Nested arrays become sub-bullets of the bullet above",),
      ),
    ),
    (
      role: "Software Engineer Intern",
      company: "Another Company",
      location: "Remote",
      dates: (start: "May 2022", end: "Jun 2024"),
      description: (
        "I did something cool",
        [Content blocks work too, for *bold* or #link("https://typst.app")[links]],
      ),
    ),
  ),

  projects: (
    (
      name: "MyCV",
      role: "Maintainer",
      url: "https://github.com/TuringProblem/MyCV",
      dates: (start: "Sep 2026"),
      description: ("A declarative resume template for Typst",),
    ),
  ),

  // A dictionary becomes "Label: a, b, c" bullets.
  skills: (
    "Languages": ("TypeScript", "Python", "Rust", "Java"),
    "Technologies": ("React", "Docker", "Git", "PostgreSQL"),
    "Interests": "Rock climbing, Tetris",
  ),

  // Any other key becomes its own section, titled by the key.
  // "Leadership": ((title: "President", organization: "Some Club", dates: "2024"),),
))
