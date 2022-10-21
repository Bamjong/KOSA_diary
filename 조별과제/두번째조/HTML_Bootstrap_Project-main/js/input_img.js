

  const fileInput = document.getElementById("fileUpload_img");

  const handleFiles = () => {
  const selectedFile = [...fileInput.files];
  const fileReader = new FileReader();

   fileReader.readAsDataURL(selectedFile[0]);

  fileReader.onload = () => {
    console.log(fileReader);
    document.getElementById("previewImg_in").src = fileReader.result;
    document.getElementById("previewImg_out").src = fileReader.result;
    console.log(fileReader.result);
  };
};

fileInput.addEventListener("change", handleFiles);




// https://developer-talk.tistory.com/330

