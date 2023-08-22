const user = {
  name: "Piyush Sharma",
  designation: "Senior Software Engineer",
  company: "Infuse Consulting",
  hobbies: ["Reading", "Listening to music", "Collecting stamps"],
};

let uname = document.getElementById("name");
let designation = document.getElementById("designation");
let company = document.getElementById("company");
let hob = document.getElementById("hobby");

/**
 * Use destructuting to log the following
 */

const printUserProfile = () => {
  // Piyush Sharma is a Senior Software Engineer at Infuse Consulting. He likes Reading, Listening to music and Collecting stamps

  // Print on front end

  uname.innerHTML = user.name;
  designation.innerHTML = user.designation;
  company.innerHTML = "<span>" + user.company + "</span>";
  let hobby = user.hobbies;

  hob.innerHTML =
    "<span>Hobbies</span> : </br>" +
    `${user.name} is a ${user.designation} at ${user.company}. He likes ${hobby
      .slice(0, hobby.length - 1)
      .join(",")} and ${hobby[hobby.length - 1]}`;

  // For printing in console

  user;

  console.log(
    `${user.name} is a ${user.designation} at ${user.company}. He likes ${hobby
      .slice(0, hobby.length - 1)
      .join(",")} and ${hobby[hobby.length - 1]}`
  );
};

printUserProfile();
