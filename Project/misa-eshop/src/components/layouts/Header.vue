<template>
  <nav class="main-header h-container-row">
    <div class="catalog-name h2">Cửa Hàng</div>

    <ul class="user-head ml-auto">
      <li class="item-head mr-1 h-container-center">
        <select name="restaurantName" class="form-control">
          <option value="0">--Chọn cửa hàng--</option>
          <option value="1">DODAVI-160 HOÀNG HOA THÁM</option>
          <option value="2">SENLIVE-175 ĐƯỜNG LÁNG</option>
          <option value="3">HENCI-24 TRẦN QUỐC HOÀN</option>
        </select>
      </li>
      <li class="item-head h-container-center">
        <img
          src="~@/assets/img/default-avatar.jpg"
          class="img-circle"
          height="40"
        />
        <select name="userName" class="select-head">
          <option value="0">Vũ Minh Hiếu</option>
          <option value="1">Lê Hồng Phong</option>
          <option value="2">Nguyễn Danh Lưu</option>
          <option value="3">Trịnh Đình Quang</option>
        </select>
      </li>
      <li class="item-head h-container-center-center item-head-call h-active">
        <div class="circle-boder-icon h-container-center-center">
          <i class="fas fa-phone-alt fa-lg">
            <span class="text-inclined"> New </span>
          </i>
        </div>
      </li>
      <li class="item-head h-container-center-center item-head-icon">
        <i class="fas fa-bell fa-2x">
          <span class="item-head-notify"></span>
        </i>
      </li>
      <li class="item-head h-container-center-center item-head-icon">
        <i class="fas fa-question-circle fa-2x"></i>
      </li>
    </ul>
  </nav>
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
.main-header {
  position: relative;
  margin-left: 200px;
  height: 60px;
  width: calc(100% - 200px);
  background-color: #ffff;
  box-sizing: border-box;
  padding: 0 10px;
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.15), 0px 0px 25px rgba(0, 0, 0, 0.12) !important;
  z-index: 2;
}
.catalog-name {
  line-height: 60px;
  margin-left: 0.6rem;
  /* không cho xuống dòng */
  white-space: nowrap;
}

.user-head {
  height: 60px;
  display: flex;
  flex-direction: row;
  padding-left: 0;
  margin-bottom: 0;
  margin-top: 0px;
  list-style: none;
}
.option-head {
  margin: 10px 0;
  width: 40px;
}

.item-head {
  line-height: 40px;
  cursor: pointer;
  margin-right: 5px;
  display: flex;
}
.select-head {
  border: none;
  max-width: 150px;
}
.select-head:focus {
  border-color: #66afe9;
  outline: 0;
  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075),
    0 0 8px rgba(102, 175, 233, 0.6);
  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075),
    0 0 8px rgba(102, 175, 233, 0.6);
}

.item-head-icon {
  width: 60px;
  color: #00557b;
  margin: 0;
  border-right: 1px solid #bbbbbb;
}
.item-head-icon:last-child {
  border-right: 0;
}

.item-head-call {
  color: #ffffff;
  width: 60px;
  margin: 0;
  overflow: hidden;
}

.item-head i {
  position: relative;
}

.item-head-notify {
  height: 12px;
  width: 12px;
  background: #ffa500f2;
  font-size: 10px;
  color: #ffffff;
  line-height: 13px;
  text-align: center;
  font-weight: 700;
  display: inline-block;
  border-radius: 50%;
  position: absolute;
  top: 4px;
  right: -4px;
}
.text-inclined {
  background: #ff0000;
  color: #ffffff;
  line-height: 16px;
  transform: rotate(45deg);
  font-size: 12px;
  position: absolute;
  top: -18px;
  left: -14px;
  text-align: center;
  width: 5rem;
}

.circle-boder-icon {
  position: relative;
  border: 6px solid #ffffff;
  background-color: transparent;
  border-radius: 50%;
  height: 40px;
  width: 40px;
}
.circle-boder-icon::after {
  content: " ";
  position: absolute;
  height: 8px;
  width: 8px;
      left: 0px;
    bottom: -2px;
  border: 5px solid;
  border-color: transparent transparent #00557b transparent;
  border-right: none;
  transform: rotate(-20deg);
}
</style>
