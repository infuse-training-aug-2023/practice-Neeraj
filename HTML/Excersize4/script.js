const user = {
    name: "Piyush Sharma",
    designation: "Senior Software Engineer",
    company: "Infuse Consulting",
    hobbies: ["Reading", "Listening to music", "Collecting stamps"],
  };
  
  let uname = document.getElementById("name");
  let designation = document.getElementById("designation");
  let company = document.getElementById("company");
  let hobby = document.getElementById("hobby");
  
  /**
   * Use destructuting to log the following
   */
  
  const printUserProfile = () => {
    // Piyush Sharma is a Senior Software Engineer at Infuse Consulting. He likes Reading, Listening to music and Collecting stamps
  
    // Print on front end
  
    uname.innerHTML = user.name;
    designation.innerHTML = user.designation;
    company.innerHTML = "<span>" + user.company + "</span>";
  
    hobby.innerHTML = "Hobbies : </br>" + user.hobbies.join();
  
    // For printing in console
  
    console.log(
      `${user.name} is a ${user.designation} at ${
        user.company
      }. He likes ${user.hobbies.join()}`
    );
  };
  
  printUserProfile();
  