function fetchData() {
  fetch(`https://api.example.com/data?api_key=${apiKey}`, {
    headers: {
      'Authorization': `Bearer ${githubToken}`
    }
  })
    .then((response) => response.json())
    .then((data) => console.log(data))
    .catch((error) => console.error('Error:', error));
}
