window.onload = function() {
// query form
const form = document.getElementById('query-form');

// text input field
const query = document.getElementById('query');
const list = document.getElementById('list-data')

// set onsubmit
form.onsubmit = function(event) {
	event.preventDefault();


	// get value in input field
	const queryTerm = query.value;
	getTaggedPhotos(queryTerm)
	console.log(queryTerm)
}



function getTaggedPhotos(tagName) {
	fetch('https://api.giphy.com/v1/gifs/search?q=' + tagName +
   '&api_key=xi8S07fI9CrsFZvXx0lIs5WW0xTtFXrj&limit=20')
		.then(function(response) {

			if (!response.ok){
				window.alert('Hey, seems like something went wrong, please email <email address> for reports!');
				return;
			}
			return response.json();
		})
		.then(function(result) {

			if (!result){
				return;
			}

			list.innerHTML = '';

			const items = result.data;

			for (let i = 0; i < items.length; i++) {

				const item = items[i];

//inline frame. embed inside another html to website.
// insert content from another resources
        if (item.url != undefined) {
						const iframe = document.createElement('iframe');
						iframe.src = "https://giphy.com/embed/" + item.id
            iframe.width="150"
            iframe.height="150"
            iframe.frameBorder="0"
            iframe.class="giphy-embed"
            iframe.allowFullScreen
            console.log(iframe.src)

					const li = document.createElement('li');
					li.appendChild(iframe)

					list.appendChild(li)
				}
			}
		})
		.catch(function(err) {
			window.alert('Hey, seems like the Tumblr API is down, please try again later!')
			console.log("Message: " + err)
		})
  }
};
