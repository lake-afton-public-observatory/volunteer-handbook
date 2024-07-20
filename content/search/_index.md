---
title: "Search"
layout: sublist
weight: 9999
exclude_search: True
---

<script src="https://unpkg.com/lunr/lunr.js"></script>
<script type="text/javascript">

// define globale variables
var idx, searchInput, searchResults = null
var documents = []

function renderSearchResults(results){

    if (results.length > 0) {

        // show max 10 results
        if (results.length > 9){
            results = results.slice(0,10)
        }

        // reset search results
        searchResults.innerHTML = ''

        // append results
        results.forEach(result => {
        
            // create result item
            var article = document.createElement('article')
            article.innerHTML = `
            <a href="${result.ref}"><h4 class="title">${documents[result.ref].title}</h4></a>
            <p><a href="${result.ref}">${result.ref}</a></p>
            `
            if(documents[result.ref].description != '') {
                article.innerHTML += `
                <p>${documents[result.ref].description}<p>
                `
            }
            article.innerHTML += `<hr/>`
            searchResults.appendChild(article)
        })

    // if results are empty
    } else {
        searchResults.innerHTML = '<p>No results found.</p>'
    }
}

function registerSearchHandler() {

    // register on input event
    searchInput.oninput = function(event) {

        // remove search results if the user empties the search input field
        if (searchInput.value == '') {
            
            searchResults.innerHTML = ''
        } else {
            
            // get input value
            var query = event.target.value

            // run fuzzy search
            var results = idx.search(query + '*')

            // render results
            renderSearchResults(results)
        }
    }

    // set focus on search input and remove loading placeholder
    searchInput.focus()
    searchInput.placeholder = 'Enter search string here...'
}

window.onload = function() {

    // get dom elements
    searchInput = document.getElementById('search-input')
    searchResults = document.getElementById('search-results')

    // request and index documents
    fetch('/index.json', {
        method: 'get'
    }).then(
        res => res.json()
    ).then(
        res => {

            // index document
            idx = lunr(function() {
                this.ref('url')
                this.field('title')
                this.field('content')

                res.forEach(function(doc) {
                    this.add(doc)
                    documents[doc.url] = {
                        'title': doc.title,
                        'content': doc.content,
                        'description': doc.description
                    }
                }, this)
            })

            // data is loaded, next register handler
            registerSearchHandler()
        }
    ).catch(
        err => {
            searchResults.innerHTML = `<p>${err}</p>`
        }
    )
}
</script>

To search the LAPO Volunteer Handbook, please enter your search terms here...

<input class="search-input" id="search-input" type="text" placeholder="Loading..." name="search">

<br/>

<br/>

<hr/>

<section id="search-results" class="search"></section>
