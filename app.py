from flask import Flask, render_template, request, redirect, url_for
import mysql.connector

app = Flask(__name__)


# =========================================
# MYSQL CONNECTION
# =========================================

def get_db_connection():

    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="root",
        database="thoothukudi_rental"
    )

    return connection


# =========================================
# HOME PAGE
# =========================================

@app.route("/")
def home():

    connection = get_db_connection()

    cursor = connection.cursor(dictionary=True)

    cursor.execute("""
        SELECT *
        FROM areas
        ORDER BY area_name
    """)

    areas = cursor.fetchall()

    cursor.close()
    connection.close()

    return render_template(
        "index.html",
        areas=areas
    )


# =========================================
# SEARCH HOUSES
# =========================================

@app.route("/houses")
def houses():

    area = request.args.get("area", "")
    bhk = request.args.get("bhk", "")
    price = request.args.get("price", "")
    furnishing = request.args.get("furnishing", "")
    house_type = request.args.get("house_type", "")
    parking = request.args.get("parking", "")


    connection = get_db_connection()

    cursor = connection.cursor(dictionary=True)


    query = """
        SELECT
            houses.*,
            areas.area_name,
            owners.owner_name,
            owners.phone

        FROM houses

        JOIN areas
        ON houses.area_id = areas.area_id

        JOIN owners
        ON houses.owner_id = owners.owner_id

        WHERE 1=1
    """


    values = []


    # AREA

    if area:

        query += """
            AND areas.area_id = %s
        """

        values.append(area)


    # BHK

    if bhk:

        query += """
            AND houses.bhk = %s
        """

        values.append(bhk)


    # PRICE

    if price == "under10000":

        query += """
            AND houses.monthly_rent < 10000
        """


    elif price == "10000-15000":

        query += """
            AND houses.monthly_rent
            BETWEEN 10000 AND 15000
        """


    elif price == "15000-20000":

        query += """
            AND houses.monthly_rent
            BETWEEN 15000 AND 20000
        """


    elif price == "above20000":

        query += """
            AND houses.monthly_rent > 20000
        """


    # FURNISHING

    if furnishing:

        query += """
            AND houses.furnishing = %s
        """

        values.append(furnishing)


    # HOUSE TYPE

    if house_type:

        query += """
            AND houses.house_type = %s
        """

        values.append(house_type)


    # PARKING

    if parking:

        query += """
            AND houses.parking = %s
        """

        values.append(parking)


    query += """
        ORDER BY houses.monthly_rent ASC
    """


    cursor.execute(
        query,
        values
    )

    houses = cursor.fetchall()


    cursor.close()
    connection.close()


    return render_template(
        "houses.html",
        houses=houses
    )


# =========================================
# ADD HOUSE
# =========================================

@app.route(
    "/add-house",
    methods=["GET", "POST"]
)
def add_house():


    if request.method == "POST":


        owner_name = request.form["owner_name"]

        phone = request.form["phone"]

        email = request.form["email"]

        area_id = request.form["area_id"]

        address = request.form["address"]

        bhk = request.form["bhk"]

        rent = request.form["rent"]

        advance = request.form["advance"]

        bedrooms = request.form["bedrooms"]

        bathrooms = request.form["bathrooms"]

        floor = request.form["floor"]

        house_type = request.form["house_type"]

        furnishing = request.form["furnishing"]

        parking = request.form["parking"]

        water_supply = request.form["water_supply"]

        pets_allowed = request.form["pets_allowed"]

        preferred_tenant = request.form["preferred_tenant"]

        description = request.form["description"]


        connection = get_db_connection()

        cursor = connection.cursor()


        # -------------------------
        # ADD OWNER
        # -------------------------

        cursor.execute("""
            INSERT INTO owners
            (
                owner_name,
                phone,
                email
            )

            VALUES
            (
                %s,
                %s,
                %s
            )
        """, (
            owner_name,
            phone,
            email
        ))


        owner_id = cursor.lastrowid


        # -------------------------
        # ADD HOUSE
        # -------------------------

        cursor.execute("""
            INSERT INTO houses
            (
                owner_id,
                area_id,
                address,
                bhk,
                monthly_rent,
                advance_amount,
                bedrooms,
                bathrooms,
                floor,
                house_type,
                furnishing,
                parking,
                water_supply,
                pets_allowed,
                preferred_tenant,
                description,
                status
            )

            VALUES
            (
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                'Available'
            )
        """, (

            owner_id,
            area_id,
            address,
            bhk,
            rent,
            advance,
            bedrooms,
            bathrooms,
            floor,
            house_type,
            furnishing,
            parking,
            water_supply,
            pets_allowed,
            preferred_tenant,
            description

        ))


        connection.commit()

        cursor.close()

        connection.close()


        return redirect(
            url_for("houses")
        )


    # GET REQUEST

    connection = get_db_connection()

    cursor = connection.cursor(
        dictionary=True
    )


    cursor.execute("""
        SELECT *
        FROM areas
        ORDER BY area_name
    """)


    areas = cursor.fetchall()


    cursor.close()

    connection.close()


    return render_template(
        "add_house.html",
        areas=areas
    )


# =========================================
# RUN
# =========================================

if __name__ == "__main__":

    app.run(
        debug=True
    )