function searchHouses() {

    let input =
        document.getElementById("searchInput");

    let filter =
        input.value.toLowerCase();

    let cards =
        document.getElementsByClassName("house-card");


    for (
        let i = 0;
        i < cards.length;
        i++
    ) {

        let text =
            cards[i].innerText.toLowerCase();


        if (text.includes(filter)) {

            cards[i].style.display = "";

        } else {

            cards[i].style.display = "none";

        }

    }
}


function validateHouseForm() {

    let phone =
        document.querySelector(
            'input[name="phone"]'
        ).value;


    if (!/^[0-9]{10}$/.test(phone)) {

        alert(
            "Please enter a valid 10 digit phone number."
        );

        return false;
    }


    return true;
}