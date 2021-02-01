# Xtreme_Prestige_Worldwide_BnB

## User Stories

```
As a BnB owner,
So others can view my space on MakersBnB,
I want to list my space.

As a BnB owner,
So others can book my space on MakersBnB,
I want to offer a date when the space is available.

As a BnB owner,
So I can post on MakersBnB,
I want to sign up.

As a holiday maker,
So I can book places on MakersBnB,
I want to request to book a listing.
```

Databse names: makers_bnb makers_bnb_test

### Listing

| Responsibilities        | Collaborators |
| ----------------------- | ------------- |
| make a new listing      |               |
| be able to show listing |               |
| have an available date  |               |

table: listing
id name free_date

### Booking

| Responsibilities           | Collaborators |
| -------------------------- | ------------- |
| have a booking function    | Listing       |
| be able to check free date |

table: booking
id listing_id user_id

### User

| Responsibilities    | Collaborators |
| ------------------- | ------------- |
| can sign up         | Listing       |
| can request booking | Booking       |

table: user
id email password name
