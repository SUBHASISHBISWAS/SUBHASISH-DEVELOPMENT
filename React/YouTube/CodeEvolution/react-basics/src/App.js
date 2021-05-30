import logo from './logo.svg';
import './App.css';
import Greet from './Components/1-FunctionalComponent';
import GreetClassComponent from './Components/2-GreetClassComponent';
import JSXComponent from './Components/3-JSXComponent';
import { ReactProps } from './Components/4-FReactProps';
import CReactProps from './Components/5-CReactProps';
import CState from './Components/6-CState';
import CStateAdvanced from './Components/7-CStateAdvanced'
import CBulkSetSateUpdate from './Components/8-CBulkSetSateUpdate';

function App() {
  return (
    <div className="App">

      <CBulkSetSateUpdate/>

      {/* <CStateAdvanced/> */}

      {/* <CState/> */}
      {/* <CReactProps name ='Subhasish' title='Biswas'/>

      <ReactProps name ='Subhasish' title='Biswas'>
        <p> I am </p>
      </ReactProps>
      
      <ReactProps name ='Subhasish' title='Biswas'/> */}
      {/* <JSXComponent/>  */}
      {/* <GreetClassComponent/> */}
      {/* <Greet/> */}
      
    </div>
  );
}

export default App;
