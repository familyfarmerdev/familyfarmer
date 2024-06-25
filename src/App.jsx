import React from 'react'
import {
  BrowserRouter as Router,
  Route,
  Routes,
  Navigate,
} from "react-router-dom";

import Home from './pages/home/Home';
import Order from './pages/order/Order';
import Cart from './pages/cart/Cart';
import NoPage from './pages/nopage/NoPage';
import MyState from './context/MyState.jsx';
import Login from './pages/registration/Login';
import Signup from './pages/registration/Signup';
import ProductInfo from './pages/productInfo/ProductInfo';
import { ToastContainer } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import Allproducts from './pages/allproducts/Allproducts';
function App() {
  const isAuth = localStorage.getItem("isAuth")
  const isAdmin =     localStorage.getItem("isAdminUserFF")

  return (
    <MyState>
      <Router>
        <Routes>
          <Route path="/" element={isAuth?<Home/>:<Signup/>} />
                    <Route path="/home" element={<Home />} />

          <Route path="/allproducts" element={<Allproducts />} />
          <Route path="/order" element={
              <Order />
          } />
          <Route path="/cart" element={<Cart />} />
      
          <Route path='/login' element={isAuth?(<Home/>):<Login/>} />
          <Route path='/productinfo/:id' element={<ProductInfo/>} />
       
          <Route path="/*" element={<NoPage />} />
        </Routes>
        <ToastContainer/>
      </Router>
    </MyState>

  )
}

export default App 

// user 

export const ProtectedRoute = ({children}) => {
  const user = localStorage.getItem('user')
  if(user){
    return children
  }else{
    return <Navigate to={'/login'}/>
  }
}

// admin 

