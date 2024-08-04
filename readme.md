<h1 align="center">Head 2 Head - Server Side</h1>
<p align="center">
  <img src="https://res.cloudinary.com/dwygxzqku/image/upload/v1722631715/H2H/h2h-logos/H2H-Logo_jnhf5q.png" 
    alt="H2H Logo" 
    style="border-radius: 15px;"
  />
</p>

## Live Demo
H2H is your ultimate app for finding teammates, creating matches, and elevating your basketball experience. Our platform simplifies the process of building teams and setting up games, helping you reconnect with the thrill of competitive sports.

**Key Features:**

- **Find Teammates:** Easily discover and connect with players who share your passion for basketball.
- **Create Matches:** Set up and organize games with just a few clicks, ensuring smooth and efficient match scheduling.
- **Personalized Player Profiles:** Showcase your skills and achievements with detailed profiles tailored to your playing style.
- **Professional Athlete-Like Stats:** Track your performance with advanced statistics that mirror those of professional athletes, adding depth to your game.
- **Opportunities for Excellence:** Whether you aim for individual recognition or team glory, H2H offers various ways to shine and be acknowledged.

Experience the perfect blend of digital convenience and real-life sports excitement with H2H, where every game and player counts.
Check out the live demo of the Head 2 Head app here: [Deployed App](https://your-deployed-app-url)

## Server Overview
This Express server integrates Firebase for user authentication and management. It supports Google Sign-In and Email/Password login through Firebase Authentication and manages user data using RESTful API endpoints. This server also interacts with a PostgreSQL database for various functionalities.

**Server Features**

- **User Management**: Create, read, update, and delete user profiles.
- **Authentication**: Manage user sessions using Firebase Authentication for Google Sign-In and Email/Password login. Authentication state managed using `express-session` and `passport.js`.
- **API Endpoints**: Manage user data through RESTful API endpoints for user profiles and settings. RESTful endpoints for user, team, match, badge, and basketball data management.
- **Error Handling**: Each route handles errors with appropriate HTTP status codes and messages.
- **Data Management**: Interact with PostgreSQL for data storage and retrieval. The routes rely on various query functions from `queries` files to interact with the database.

## Database Configuration

The application uses PostgreSQL and `pg-promise` for database interactions. The database configuration is defined in the `db.js` file as follows:
Make sure to provide the necessary environment variables in the `.env` file.

## API Endpoints

The server exposes the following API endpoints:

#### User Management

- **Register a New User**
  
  `POST /api/auth/register`
  
  Create a new user with Firebase Authentication (Email/Password or Google Sign-In).

- **Get User by UID**
  
  `GET /api/auth/user/:uid`
  
  Retrieve user information by Firebase UID.

- **Get User by ID**
  
  `GET /api/auth/user/single/:id`
  
  Retrieve user information by your internal user ID.

- **Delete User by ID**
  
  `DELETE /api/auth/user/:id`
  
  Delete a user by your internal user ID and remove them from Firebase.

- **Update User Team ID**
  
  `PUT /api/auth/user/:id`
  
  Update the team ID for a user.

#### Team Management

- **Create a Team**
  
  `POST /api/teams`
  
  Create a new team.

- **Get All Teams**
  
  `GET /api/teams`
  
  Retrieve a list of all teams or a team by player ID.

- **Get Team by ID**
  
  `GET /api/teams/:id`
  
  Retrieve a specific team by ID.

- **Update a Team**
  
  `PUT /api/teams/:id`
  
  Update a team’s details.

#### Match Management

- **Get All Matches**
  
  `GET /api/matches`
  
  Retrieve all matches or filter by team/player ID.

- **Get Match by ID**
  
  `GET /api/matches/:id`
  
  Retrieve a specific match by ID.

- **Create a Match**
  
  `POST /api/matches`
  
  Create a new match.

- **Update a Match**
  
  `PUT /api/matches/:id`
  
  Update match details.

- **Delete a Match**
  
  `DELETE /api/matches/:id`
  
  Delete a match by ID.

#### Badge Management

- **Add Badge to Team**
  
  `POST /api/badges/teams/:teamId/badges/:badgeId`
  
  Assign a badge to a team.

- **Get Badges by Team ID**
  
  `GET /api/badges/teams/:teamId`
  
  Retrieve all badges for a specific team.

- **Get Badge by ID**
  
  `GET /api/badges/:badgeId`
  
  Retrieve a specific badge by ID.

- **Get All Badges**
  
  `GET /api/badges`
  
  Retrieve a list of all badges.

#### Basketball Courts Location Data

- **Get All Basketball Courts**
  
  `GET /api/bball`
  
  Retrieve a list of all basketball courts from the dataset.

- **Get Basketball Court by ID**
  
  `GET /api/bball/:id`
  
  Retrieve details for a specific basketball court by ID.

## Dependencies

Here's a list of the main dependencies used in this project:

- **auth**: `^1.1.1` - Includes features for managing user login, registration, and session management.
- **cors**: `^2.8.5` - Essential for handling cross-origin requests and ensuring secure interactions between web applications and servers
- **dotenv**: `^16.4.5` - Useful for managing configuration settings and secrets in the application without hardcoding.
- **express**: `^4.19.2` - Simplifies the creation of server-side logic and routing.
- **firebase**: `^10.12.3` - Provides tools and infrastructure to develop high-quality apps, including features like real-time databases, authentication, analytics, and cloud messaging.
- **firebase-admin**: `^12.0.0` - Provides administrative capabilities such as managing users, sending notifications, and accessing Firebase services from the server.
- **pg-promise**: `^11.6.0` - PostgreSQL promise-based library for Node.js.

## Project Setup

### Prerequisites

Ensure you have the following installed:
- **Node.js** (>=14.x)
- **npm**

### Setup Instructions

1. **Clone the Server-Side Repository**

   ```bash
   git clone https://github.com/Jadeng62/H2H-backend.git
   cd H2H-backend
   ```

2. **Clone the Client-Side Repository**: Navigate to https://github.com/Jadeng62/H2H-frontend.git for more detailed instructions setting up the client-side.
   ```bash
   git clone https://github.com/Jadeng62/H2H-frontend.git
   ```

3. **Install Dependencies**

   ```bash
   npm install
   ```

4. **Configure Firebase**

   - **Generate Firebase Service Account Key**:
     1. Go to the Firebase Console.
     2. Navigate to Project Settings > Service accounts.
     3. Click "Generate new private key" and save the JSON file.

   - **Convert the JSON to Base64**:
     Use a tool or script to convert the JSON file to a base64 string.

5. **Set Up Environment Variables**

   Create a `.env` file in the root directory of your project with the following content, replacing placeholders with your configuration values:

   ```plaintext
   PORT=3003
   PG_HOST=localhost
   PG_PORT=5432
   PG_DATABASE=h2h_backend
   PG_USER=postgres
   PG_PASSWORD=your_postgres_password
   FIREBASE_SERVICE_ACCOUNT=YOUR_BASE64_ENCODED_FIREBASE_SERVICE_ACCOUNT
   ```

6. **Database Setup**

   - Create a PostgreSQL database and run the schema and seed SQL files:
     ```bash
     npm run db:init
     npm run db:seed
     ```

7. **Run the Server**

   For development mode:
   ```bash
   npm run dev
   ```

8. **Verify the Server is Running**

   Open your browser and go to `http://localhost:3003` to see the server in action.
