import React from "react";
import PropTypes from "prop-types";

const Header = ({ title }) => {
  return (
    <header>
      <h1>{title}</h1>
    </header>
  );
};

Header.protoTypes = {
  title: PropTypes.string.isRequired,
};

const headingStyle = {
  color: "green",
  backgroundColor: "black",
};
export default Header;
