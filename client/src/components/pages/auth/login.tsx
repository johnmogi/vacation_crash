import * as React from "react";
import { Component, SyntheticEvent } from "react";
import { Redirect } from "react-router-dom";

interface LoginState {
  toDashboard: boolean,
  user: {
    "userName": String;
    "password": String;
  };
}

export class SignIn extends Component<any, LoginState> {
  public constructor(props: any) {
    super(props);
    this.state = {
      toDashboard: false,
      user: {
        "userName": "",
        "password": ""
      }
    };
  }
  private setUserName = (args: SyntheticEvent) => {
    const userName = (args.target as HTMLInputElement).value;
    const user = { ...this.state.user };
    user.userName = userName;

    console.log(user)
    this.setState({ user });
  };
  private setUserPassword = (args: SyntheticEvent) => {
    const password = (args.target as HTMLInputElement).value;
    const user = { ...this.state.user };
    user.password = password;
    this.setState({ user });
  };

  private logUser = () => {
    const options = {
      method: "POST",
      headers: {
        "Content-Type": "application/json", // What type we are sending (MIME Types)
        "Accept": "application/json" // What type we are expecting to get back (MIME Types)
      },
      body: JSON.stringify(this.state.user)
    };

    fetch("http://localhost:3003/api/auth/login", options)
    .then(async response => {
      if (!response.ok)
          throw new Error(await response.text());
      return response;
  })
      .then(response => response.json()
      .then(() => this.setState(() => ({
        toDashboard: true
      })))
    
     
      // .then(user => {
      //   this.props.history.push("/vacations"); // Redirect to "/products" route.
      )
      .catch(err => console.log(err.message));
  };
  public loggedIn = () => {
    console.log("user is now logged in");
  };

  //   const options = {
  //     method: "POST",
  //     headers: {
  //       "Content-Type": "application/json", // What type we are sending (MIME Types)
  //       Accept: "application/json" // What type we are expecting to get back (MIME Types)
  //     },
  //     // body: JSON.stringify(this.state.user) // What data we are sending
  //     body: this.state.user // What data we are sending
  //   };
  //   fetch("http://localhost:3003/api/auth/login", options)
  //     .then(response => response.json())
  //     .then(user => {
  //       alert("user is now logged in, user:  " + this.state.user.userName);
  //       this.props.history.push("/vacations"); // Redirect to "/products" route.
  //     })
  //     .catch(err => alert(err.message));
  // };

  render() {
    if (this.state.toDashboard === true) {
      return <Redirect to='/vacations' />
    }
    return (
      <div className="signin">
        <form>
          <input type="text" placeholder="Name..." onBlur={this.setUserName} />
          <br /> <br />
          <input
            type="text"
            placeholder="Password..."
            onChange={this.setUserPassword}
          />
          <br /> <br />
          <button
            className="btn btn-primary"
            type="button"
            onClick={this.logUser}
          >
            Log me in, Scottie!
          </button>
        </form>
      </div>
    );
  }
}
