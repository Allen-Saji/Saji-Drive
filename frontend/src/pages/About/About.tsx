import SajiDrive from "../../assets/SajiDrive.png";
import "./about.css";

function About() {
  return (
    <div>
      <div className="header">
        <img src={SajiDrive} className="logo" alt="logo" />
        <div className="btn-grp">
          <button className="login-button">
            <h3>Login</h3>
          </button>
          <button className="login-button">
            {" "}
            <h3>Signup</h3>
          </button>
        </div>
      </div>
      <div className="about-title">
        <img src={SajiDrive} className="logo-title" alt="logo" />
        <h1>Files Empowered, Decentralized Strength</h1>
      </div>
      <div className="about-content">
        <div className="feature">
          <div className="feature-heading">
            <h3>Decentralized File Storage</h3>
          </div>
          <div className="feature-body">
            <p>Securely store and share files using IPFS technology.</p>
          </div>
        </div>
        <div className="feature">
          <div className="feature-heading">
            <h3>Access and Control Sharing</h3>
          </div>
          <div className="feature-body">
            <p> Control file access and share securely with other users.</p>
          </div>
        </div>
        <div className="feature">
          <div className="feature-heading">
            <h3>Seamless Metamask Integration</h3>
          </div>
          <div className="feature-body">
            <p>Login and interact effortlessly with your Ethereum wallet.</p>
          </div>
        </div>
      </div>
    </div>
  );
}

export default About;
