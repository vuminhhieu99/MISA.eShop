<template>
  <aside class="main-sidebar h-primary">
    <div class="logo h-active">
      
        <a class="logo-page " href="#"> </a>
      
    </div>
    <div class="sidebar">
      <nav>
        <ul class="h-container-column">
          <li class="h-item">
            <a href="#" class="h-item-link h-hover h-selecled">
              <i class="h-icon-nav fas fa-tachometer-alt fa-lg"></i>
              <p class="h-item-text">Tổng quan</p>
            </a>
          </li>
          <li class="h-item">
            <a href="#" class="h-item-link h-hover h-selecled">
              <i class="h-icon-nav fas fa-chart-pie fa-lg"></i>
              <p class="h-item-text">Báo cáo</p>
            </a>
          </li>
          <li class="h-item">
            <a href="#" class="h-item-link h-hover h-selecled">
              <i class="h-icon-nav fas fa-truck fa-lg"></i>
              <p class="h-item-text">Đơn hàng</p>
            </a>
          </li>
          <li class="h-item">
            <a href="#" class="h-item-link h-hover h-selecled">
              <i class="h-icon-nav fas fa-shopping-cart fa-lg"></i>
              <p class="h-item-text">Mua hàng</p>
            </a>
          </li>
           <li class="h-item">
            <a href="#" class="h-item-link h-hover h-selecled">
              <i class="h-icon-nav fas fa-gift fa-lg"></i>
              <p class="h-item-text">Khuyễn mãi</p>
            </a>
          </li>
          <li class="h-item">
            <a href="#" class="h-item-link h-hover h-selecled">
              <i class="h-icon-nav fas fa-list-ul fa-lg"></i>
              <p class="h-item-text">Quản lý cửa hàng</p>
            </a>
          </li>
          <li class="h-item">
            <a href="#" class="h-item-link h-hover h-selecled">
              <i class="h-icon-nav fas fa-cubes fa-lg"></i>
              <p class="h-item-text">Hàng hóa</p>
            </a>
          </li>
        </ul>
      </nav>
    </div>
  </aside>
</template>

<script>
export default {
  name: "HelloWorld",
  props: {
    msg: String,
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.Wapper,
body,
html {
  min-height: 100%;
}


.sidebar {
  color: white;
 
}

.main-sidebar {
  position: fixed;
  top: 0;
  left: 0;
  width: 200px;
  height: 100vh;  
  color: white;
  box-shadow: 0 0px 5px rgba(0, 0, 0, 0.2), 0px 0px 20px rgba(0, 0, 0, 0.18)!important;
   z-index: 1;
}

/*.main-sidebar:hover {
        transition: 0.25s;
        width: 50px;
    }*/
.main-sidebar .logo {
  position: relative;
  width: 100%;
  height: 60px;
  margin: 0 auto;
}

.main-sidebar .logo .logo-page {
  position: absolute;
    float: left;
    width: 100%;
    height: 100%;
    margin-left: 0;
  background-image: url("../../assets/img/Logo_Full_White.png");
  background-size: contain;
  background-position: center center;
  background-repeat: no-repeat;
}

.h-container-column {
  padding: 0;
}
</style>