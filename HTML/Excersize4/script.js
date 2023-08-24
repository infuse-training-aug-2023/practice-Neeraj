const user = {
  name: "Piyush Sharma",
  designation: "Senior Software Engineer",
  company: "Infuse Consulting",
  hobbies: ["Reading", "Listening to music", "Collecting stamps"],
};

/**
 * Use destructuting to log the following
 */

const printUserProfile = () => {
  const { name, designation, company, hobbies } = user;
  // Piyush Sharma is a Senior Software Engineer at Infuse Consulting. He likes Reading, Listening to music and Collecting stamps

  console.log(
    `${name} is a ${designation} at ${company}. He likes ${hobbies
      .slice(0, hobbies.length - 1)
      .join(",")} and ${hobbies[hobbies.length - 1]}`
  );
};

printUserProfile();
