import { Header } from "./components";
import { Route, Routes, BrowserRouter as Router } from "react-router-dom";
import Home from "./pages/Home";
import Jobs from "./pages/Jobs";
import Meeting from "./pages/Meeting";

function App() {
  return (
    <div>
      <Router>
        <Header />
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/jobs" element={<Jobs />} />
          <Route path="/meetings" element={<Meeting />} />
        </Routes>
      </Router>
    </div>
  );
}

export default App;
