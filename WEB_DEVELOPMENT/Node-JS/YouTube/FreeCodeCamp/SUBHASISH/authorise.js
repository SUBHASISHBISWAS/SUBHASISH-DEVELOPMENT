//http://localhost:5000/api/?user=Subhasish

const authorize = (req,res,next)=>{

    const { user } =req.query

    if(user === 'Subhasish'){
        // if authorization happens updating user which we can access in Get route method
        req.user = {name : 'jhon', id :3}
        next()
    }
    else{
        res.status(401).send('Unauthorize')
    }
}

module.exports = authorize