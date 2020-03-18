import * as React from "react";
import { Component } from "react";
import { UserModel } from "../models/user-model";
interface checkState {
  isLoggedIn: boolean;
  user: UserModel[];
}
export class Side extends Component<any, checkState> {
  public constructor(props: any) {
    super(props);
    this.state = {
      isLoggedIn: false,
      user: []
    };
  }
  componentDidMount = () => {
    if (this.state.isLoggedIn === true) {
      return alert("hi");
    }
    // const categoryGame = this.props.match.params.category;
    // this.setState({ category: categoryGame });
    // fetch("http://localhost:3003/api/users")
    //   .then(res => res.json())
    //   .then(user => this.setState({ user }))
    //   .catch(err => alert(err.message));
  };
  render() {
    return (
      <div className="side">
        <h2>side</h2>
        is user admin?
      </div>
    );
  }
}
